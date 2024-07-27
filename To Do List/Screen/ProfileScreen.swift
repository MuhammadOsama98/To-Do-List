//
//  ProfileScreen.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct ProfileScreen: View {
    
    @StateObject var viewModel = ProfileScreenViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{

                if let user = viewModel.user{
                    Image(systemName: "person.circle").resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125,height: 125)
                        .padding()
                    
                    
                    VStack(alignment:.leading) {
                        
                        HStack {
                            Text ( "Name: ").bold()
                            Text (user.name)
                        }.padding()
                        HStack {
                            Text ("Email: ").bold()
                            Text(user.email)
                        }.padding()
                        HStack {
                            Text ("Member Since: ").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
     
                    }.padding()
                    Button("Logut") {
                        viewModel.logut()

                    }.tint(.red)
                        .padding()
                    
                    Spacer()
                }else{
                    Text("Loading Profile ....")
                }
                
                  }
                
                
            .navigationTitle("Profile Screen")
        }
        
        .onAppear{
            viewModel.fetchUser()
        }

    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
