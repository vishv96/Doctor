//
//  DoctorApp.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

@main
struct DoctorApp: App {
    
    @AppStorage("started") var isStarted = false
    @StateObject var store = AppDataStore()
    
    var body: some Scene {
        WindowGroup {
            if isStarted {
                HomeScreen()
                    .environmentObject(store)
            } else {
                ContentView()
            }
        }
    }
}
