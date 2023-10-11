//
//  HomeView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct HomeScreen: View {
    
    // MARK: - properties
    @State private var appearAnimation: Bool = false
    @State private var searchText: String = ""
    @State private var userName: String = ""
    @State private var showSearchView: Bool = false
    @State private var presentDoctorDetails: Bool = false
    @State private var selectedDoctor: Doctor?
    @Namespace private var searchAnimation
    @Namespace private var docDetailsAnimation
    @EnvironmentObject var store: AppDataStore
    
    // MARK: - Body
    var body: some View {
        ZStack {
            SearchScreen
                .opacity(showSearchView ? 1 : 0)
                .animation(.bouncy, value: showSearchView)
            HomeLandingView
                .opacity(showSearchView ? 0 : 1)
                .animation(.bouncy, value: showSearchView)
            
            VStack {
                if presentDoctorDetails {
                    DoctorDetailsView(
                        present: $presentDoctorDetails,
                        doctor: selectedDoctor,
                        animation: docDetailsAnimation
                    )
                    .cornerRadius(presentDoctorDetails ? 0 : 50)
                }
            }
            .animation(.spring(bounce: 0.2, blendDuration: 0.8), value: presentDoctorDetails)
           
            
        }
    }
    
    // MARK: - Search screen
    var SearchScreen: some View {
        SearchView(
            searchText: $searchText,
            presentSearch: $showSearchView,
            searchAnimation: searchAnimation
        ){
            VStack {
                if showSearchView {
                    DoctorsListView(
                        title: "Doctors",
                        doctors: store.doctorsList,
                        animation: docDetailsAnimation,
                        isPresentingDetails: $presentDoctorDetails,
                        selectedDoctor: $selectedDoctor
                    )
                    .matchedGeometryEffect(id: "searchlist", in: searchAnimation)
                    .padding(.horizontal)
                }
               
                Button {
                    showSearchView = false
                } label: {
                    Text("Close")
                }

            }
            
        }
    }
    
    
    // MARK: - Home screen
    var HomeLandingView: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 20) {
                // MARK: - Header view
                HomeHeaderView(name: userName)
                // MARK: - Search
                if !showSearchView {
                    SearchBar(text: $searchText, presentSearch: $showSearchView){}
                    .matchedGeometryEffect(id: "searchbar", in: searchAnimation)
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            // MARK: List
            ScrollView(showsIndicators: false){
                LazyVStack (spacing: 30){
                    CategoryList(categories: store.categories)
                    ScheduleList(schedules: store.upcommingSchedules)
                    DoctorsListView(
                        title: "Popular Doctors",
                        doctors: store.doctorsList,
                        animation: docDetailsAnimation,
                        isPresentingDetails: $presentDoctorDetails,
                        selectedDoctor: $selectedDoctor
                    )
                    .matchedGeometryEffect(id: "searchlist", in: searchAnimation)
                    .padding(.horizontal)
                }
            }
            .refreshable{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    onLoad()
                }
            }
            
        }
        .background(Color("primary"))
        .opacity(appearAnimation ? 1 : 0)
        .animation(
            .easeInOut(duration: 0.4),
            value: appearAnimation
        )
        .onAppear{
            appearAnimation = true
            onLoad()
        }
        
    }
}

// MARK: - Functions
extension HomeScreen {
    
    func onLoad() {
        updateUserInfo()
        store.fetchCategories()
        store.getuserInfo()
        store.getSchedlues()
    }
    
    func updateUserInfo() {
        guard let user = store.userInfo else {
            return
        }
        userName = user.name
    }
}

#Preview {
    HomeScreen().environmentObject(AppDataStore())
}
