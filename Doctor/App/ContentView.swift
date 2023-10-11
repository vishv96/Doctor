//
//  ContentView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("started") var isStarted: Bool = false
    
    @State private var isAnimated: Bool = false    
    
    var body: some View {
        VStack {
            ZStack {
                GradientBackground()
                    .opacity(isAnimated ? 1 : 0)
                    .animation(.easeInOut, value: isAnimated)
                Image("doctor")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .offset(y: 25)
                    .opacity(isAnimated ? 1 : 0)
                    .offset(y: isAnimated ? 0 : -15)
                    .animation(.easeIn(duration: 0.8), value: isAnimated)
                    .overlay(alignment: .topTrailing){
                        sickWomanImage
                    }
            }
            .overlay(alignment: .bottomLeading) {
                videoIcon
            }
            
            // MARK: - Text
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text("Book your doctor Any time Any where")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .opacity(isAnimated ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(1), value: isAnimated)
            }
            .padding(.horizontal, 30)
            .padding(.top, 50)
            
            Spacer()
            
            // MARK: - Button
            StyleButton(title: "Get Started") {
                isAnimated.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                    isStarted = true
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            .offset(y: isAnimated ? 0 : 200)
            .animation(.easeInOut(duration: 1), value: isAnimated)
        }
        .background(
            ZStack {
                Color("primary")
                    .edgesIgnoringSafeArea(.all)
                BackGroundView()
            }
            
        )
        .onAppear{
            isAnimated = true
        }
    }
    
    // MARK: - Sick Image
    @ViewBuilder
    var sickWomanImage: some View {
        ZStack{
            Color.white
            Image("sick-woman")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .padding(1)
        }
        .border(
            Color.white,
            width: 2
        )
        .cornerRadius(20)
        .offset(x: 20, y: 150)
        .shadow(radius: 10)
        .frame(width: 100, height: 100)
        .offset(x: isAnimated ? 0 : 160)
        .opacity(isAnimated ? 1 : 0)
        .animation(
            .spring(duration: 0.8).delay(1),
            value: isAnimated
        )
    }
    
    // MARK: - Vedio Icon
    @ViewBuilder
    var videoIcon: some View {
        VStack {
            Image(systemName: "video")
                .fontWeight(.bold)
                .foregroundColor(.accent)
                .padding()
        }
        .background(Color.white)
        .clipShape(Circle())
        .shadow(radius: 5)
        .offset(x: -20, y: -40)
        .offset(x: isAnimated ? 0 : -60)
        .opacity(isAnimated ? 1 : 0)
        .animation(
            .spring(duration: 0.8).delay(1),
            value: isAnimated
        )
    }
    
}

struct BackGroundView: View {
    var body: some View {
        VStack (spacing: 300){
            ForEach(0..<2){_ in
                BlockShapes().opacity(0.3)
            }
        }
    }
}


#Preview {
    ContentView()
}
