//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Pillars Fintech on 02/09/2023.
//

import SwiftUI
import FirebaseCore

@main
struct To_Do_ListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}



