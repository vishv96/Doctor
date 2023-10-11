//
//  HomeHeaderView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct HomeHeaderView: View {
    let welcomeMessage: String
    
    init(name: String) {
        self.welcomeMessage = "Hello \(name)"
    }
    
    var body: some View {
        HStack {
            // MARK: -  Welcome message
            VStack (alignment: .leading){
                Text(welcomeMessage)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Good morning!")
                Text("")
            }
            
            Spacer()
            
            // MARK: - Notification Bell
            
            Button(action: {
                
            }, label: {
                ZStack{
                    Color.white
                    Image(systemName: "bell")
                        .resizable()
                        .padding(14)
                        .fontWeight(.ultraLight)
                        .overlay(alignment: .topTrailing){
                            Circle()
                                .fill(Color.accentColor)
                                .frame(width:10, height: 10)
                                .offset(x:-15, y: 14)
                        }
                }
                .clipShape(Circle())
            })
            .frame(width: 50, height: 50)
            //.shadow(radius: 20)
        }
        .background(Color("primary"))
    }
}

#Preview {
    HomeHeaderView(name: "Vishnu")
}

struct HeaderPreview: PreviewProvider {
    static var previews: some View{
        HomeHeaderView(name: "Vishnu")
            .padding()
            .background(Color("primary"))
            .previewLayout(.sizeThatFits)
    }
}
