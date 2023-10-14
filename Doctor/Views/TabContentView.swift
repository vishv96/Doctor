//
//  TabContentView.swift
//  Doctor
//
//  Created by vinu vijayan on 14/10/23.
//

import SwiftUI

struct TabContentView : View {
    @State private var selectedTab = 0
    
    let tabs: [Tab] = [
        .init(title: "Schedule"),
        .init(title: "About"),
        .init(title: "Experiences"),
        .init(title: "Hospitals"),
        .init(title: "Hospitals"),
        .init(title: "Hospitals"),
        .init(title: "Hospitals"),
        .init(title: "Hospitals")
    ]
    
    init() {
        let appearance  = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{geo in
                VStack(spacing: 0) {
                    // Tabs
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)

                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                                Demo1View()
                                    .tag(0)
                                Demo2View()
                                    .tag(1)
//                                Demo3View()
//                                    .tag(2)
                            })
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationTitle("TabsSwiftUIExample")
//                .ignoresSafeArea()
            }
        }
    }
}

struct TabContentView_Preview : PreviewProvider{
    static var previews: some View{
        TabContentView()
    }
}
