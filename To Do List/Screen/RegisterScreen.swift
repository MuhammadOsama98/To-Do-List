//
//  RegisterScreen.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct RegisterScreen: View {

    @StateObject var viewModel = RegisterScreenViewModel()
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        
        VStack{
            

            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange).navigationBarBackButtonHidden(true)
            
            Form{
                TextField("Full Name", text: $viewModel.name).autocapitalization (.none)
                TextField("Email Address", text: $viewModel.email).autocorrectionDisabled ()
                    .autocapitalization (.none)
                SecureField("Password", text: $viewModel.password)
                
                
                if !viewModel.errorMessage.isEmpty {
                    Text (viewModel.errorMessage)
                        .foregroundColor(Color.red).multilineTextAlignment(.center)
                }
                
                TLButton(title: "Register", background: [.orange], action: {
                    //
                    viewModel.register()
                }).padding()
          

            }.offset(y:-50)
            
            Spacer()

        } .toolbar {
            
            // 2
            ToolbarItem(placement: .navigationBarLeading) {

                Button {
                    // 3
                    print("Custom Action")
                    dismiss()


                } label: {
                    // 4
                    HStack {

                        Image(systemName: "chevron.backward").foregroundColor(.white)
                    }
                }
            }
        }

    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}



