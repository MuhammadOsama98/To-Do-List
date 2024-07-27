//
//  ContentView.swift
//  To Do List
//
//  Created by Pillars Fintech on 02/09/2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = MainScreenViewModel()
    
    var body: some View {
        

        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView

        }else{
            LoginScreen()

        }
        
        

    }
    
    @ViewBuilder
    var accountView:some View{
        TabView{
            
            ToDoListScreen(userId: viewModel.currentUserId).tabItem{
                Label("Home", systemImage: "house")
            }
            
            ProfileScreen().tabItem {
                Label("Profile", systemImage: "person.circle")

            }

            
        }

    }//accountView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
