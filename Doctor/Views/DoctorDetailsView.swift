//
//  DoctorDetailsView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-10.
//

import SwiftUI

struct DoctorDetailsView: View {
    
    @Binding var present: Bool
    var doctor: Doctor?
    let animation: Namespace.ID
    
    var body: some View {
        VStack{
            // MARK: - Header
            HStack {
                // MARK: - Back button
                Button(action: {
                    present = false
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.black.opacity(0.7))
                })
                
                
                Spacer()
                
                
                // MARK: - Favorite
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }

                    
                    // MARK: -  Share
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                }
                .foregroundColor(.black.opacity(0.7))
                
                
            }
            .padding(.horizontal)
            
            // MARK: - Profile
            HStack(spacing: 20) {
                // MARK: -  Image view
                DocImageView(
                    id: doctor?.id ?? -1,
                    backgroundColor: .white,
                    imageUrl: doctor?.image ?? "",
                    animation: animation
                )
                .matchedGeometryEffect(id: doctor?.id ?? -1, in: animation)
                .frame(width: 150, height: 150)
                .cornerRadius(15)
                
                // MARK: - Details view
                VStack(alignment: .leading, spacing: 20) {
                    Text(doctor?.name ?? "")
                        .matchedGeometryEffect(id: "\(doctor?.name ?? "")-name", in: animation)
                    Text(doctor?.specilaity.name ?? "")
                        .matchedGeometryEffect(id: "\(doctor?.specilaity.name ?? "")-special", in: animation)
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("$\(doctor?.rate ?? 0.0, specifier: "%.1f")/hr")
                        .matchedGeometryEffect(id: "\(doctor?.rate ?? 0.0)-rate", in: animation)
                        .foregroundColor(.accent)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            // MARK: - Schedule
            Spacer()
        }
        .background(Color("primary").edgesIgnoringSafeArea(.all))
        .matchedGeometryEffect(id: "\(doctor?.id ?? -1)-background", in: animation)

    }
}


#Preview {
    @Namespace var animation
    return DoctorDetailsView(present: .constant(false), doctor: AppDataStore().doctorsList[1], animation: animation)
}
