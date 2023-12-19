//
//  Tabs.swift
//  Doctor
//
//  Created by vinu vijayan on 14/10/23.
//

import SwiftUI

struct Tab {
    var icon : Image?
    var title : String
}

struct Tabs:View {
    var fixed = false
    var tabs:[Tab]
    var geoWidth:CGFloat
    @Binding var selectedTab:Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader { proxy in
                VStack(spacing: 0){
                    HStack(spacing:0){
                        ForEach(0 ..< tabs.count, id: \.self) {row in
                            Button(action: {
                                withAnimation{
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing:0){
                                    HStack{
                                        // Image
//                                        AnyView(tabs[row].icon)
//                                            .foregroundColor(Color.black)
//                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
//                                        Spacer()
                                        // Text
                                        Text(tabs[row].title)
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
//                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    .frame(width: fixed ? (geoWidth/CGFloat(tabs.count)) : .none, height: 52)
//                                    .background(Color.green)
                                    
                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color.red : Color.gray.opacity(0.2))
                                        .frame(height: 3)
//                                    if selectedTab == row {
//                                        Rectangle().fill(Color.red).frame(width: 95,height:3)
//                                    } else {
//                                        Rectangle().fill(selectedTab == row ? Color.red : Color.gray.opacity(0.2))
//                                            .frame(height: 3)
//                                    }
                                }
//                                .fixedSize()
                            })
                            .accentColor(.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) {
                        withAnimation {
                            proxy.scrollTo(selectedTab)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
//            UIScrollView.appearance().backgroundColor = UIColor(#co/*lorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1))*/
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct Tabs_Preview:PreviewProvider {
    static var previews: some View{
        Tabs(
            fixed: false,
            tabs: [
                .init(title: "Schedule"),
                .init(title: "About"),
                .init(title: "Experiences"),
                .init(title: "Hospitals")
            ],
            geoWidth: 400,
            selectedTab: .constant(0)
        )
        .padding(.horizontal)
    }
}
