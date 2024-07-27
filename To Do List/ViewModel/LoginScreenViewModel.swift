//
//  LoginScreenViewModel.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation
import FirebaseAuth

class LoginScreenViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login(){
        
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("Called")
    }
    
    private func validate() -> Bool{
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "please fill in all fields"
            
            return false
        }
        
        guard email.contains ("@") && email.contains(".") else {
            errorMessage = "please enter valid email"
            return false
            
        }
        
        return true
        
    }
    
}
