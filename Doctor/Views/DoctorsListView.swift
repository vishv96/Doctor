//
//  DoctorsListView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import SwiftUI

struct DoctorsListView: View {
    
    let title: String
    let doctors: [Doctor]
    let animation: Namespace.ID
    @Binding var isPresentingDetails: Bool
    @Binding var selectedDoctor: Doctor?
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            ScrollView(.vertical) {
                ForEach(doctors, id: \.id) { doctor in
                    ZStack {
                        
                        Color.white
                       
                        HStack() {
                            
                            //MARK: - Image
                            DocImageView(
                                id: doctor.id,
                                backgroundColor: .accent,
                                imageUrl: doctor.image ?? "",
                                animation: animation
                            )
                            .frame(width: 70, height: 70)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: doctor.id, in: animation)

                            
                            //MARK: - Details
                            VStack(alignment: .leading, spacing: 4) {
                                Text(doctor.name)
                                    .matchedGeometryEffect(id: "\(doctor.name)-name", in: animation)

                                Text(doctor.specilaity.name)
                                    .matchedGeometryEffect(id: "\(doctor.specilaity.name)-special", in: animation)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                HStack (spacing: 0){
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("\(doctor.rating, specifier: "%.1f")")
                                        .matchedGeometryEffect(id: "\(doctor.rating)-rating", in: animation)
                                    Spacer()
                                    Text("$\(doctor.rate, specifier: "%.1f")/hr")
                                        .matchedGeometryEffect(id: "\(doctor.rate)-rate", in: animation)
                                        .foregroundColor(.accentColor)
                                }
                                .font(.footnote)
                                .padding(.top, 4)
                            }
                            .padding(.vertical)
                            Spacer()
                        }
                    }
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: "\(doctor.id)-background", in: animation, isSource: true)
                    .onTapGesture {
                        selectedDoctor = doctor
                        isPresentingDetails = true
                    }
                    
                }
            }
        }
    }
}

#Preview {
    @Namespace var animation
    return ZStack {
        Color("primary")
        DoctorsListView(
            title: "Popular Doctors",
            doctors: AppDataStore().doctorsList,
            animation: animation,
            isPresentingDetails: .constant(true),
            selectedDoctor: .constant(nil)
        ).padding(.horizontal)
    }
   
}
