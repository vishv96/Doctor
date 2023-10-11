//
//  ScheduleCellView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import SwiftUI


struct ScheduleCellView: View {
    
    let schedule: Schedule
    var remove: (Int) -> Void

    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack (spacing: 0){
            HStack {
                // MARK: - Icon
                ZStack {
                    Color.white
                    Image("doctor")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 45, height: 45)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding([.top, .bottom])
                
                // MARK: - Name
                VStack (alignment: .leading){
                    Text(schedule.doctor.name)
                        .font(.subheadline)
                    Text(schedule.doctor.specilaity.name)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .opacity(0.8)
                }
                .foregroundColor(.white)

                Spacer(minLength: 100)

                
                ZStack{
                    Color.white.opacity(0.5)
                    Image(systemName: "video")
                        .foregroundColor(.white)
                }
                .frame(width: 45, height: 45)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

            }
            .padding(.horizontal)
            
            // MARK: -  time
            VStack {
                HStack {
                    Image(systemName: "calendar")
                    Text("June 12, 9:30 AM")
                        .font(.footnote)
                        .fixedSize()
                    Spacer()

                }
                .padding(5)
                .padding(.leading, 4)
                .foregroundColor(.white)
            }
            .background(Color.white.opacity(0.2))
            .cornerRadius(7)
            .padding([.horizontal, .bottom])
            
            
        }
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

}
