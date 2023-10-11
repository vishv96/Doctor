//
//  AppDataStore.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import Foundation


final class AppDataStore: ObservableObject {
    // MARK: - properties
    @Published var categories: [Category] = [Category]()
    @Published var upcommingSchedules: [Schedule] = [Schedule]()
    @Published var doctorsList: [Doctor] = [Doctor]()
    @Published var allDoctorsList: [Doctor] = [Doctor]()
    
    var userInfo: User?
    
    init(userInfo: User? = nil) {
        self.userInfo = userInfo
        getSchedlues()
        getPopularDoctorsList()
    }
    
    func fetchCategories() {
        guard let data:[Category] = Bundle.main.data(file: "Categories.json") else {
            return
        }
        categories = data
    }
    
    func getuserInfo() {
        userInfo = .init(
            username: "Vish89",
            firstName: "Vishnu",
            lastName: "Vijayan",
            userid: "1"
        )
    }
    
    func getSchedlues() {
        guard let data:[Schedule] = Bundle.main.data(file: "Schedules.json") else {
            return
        }
        upcommingSchedules = data
    }
    
    func getPopularDoctorsList() {
        guard let data:[Doctor] = Bundle.main.data(file: "PopularDoctors.json") else {
            return
        }
        doctorsList = data
    }
    
}
