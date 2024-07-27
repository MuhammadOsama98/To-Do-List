//
//  MainScreenViewModel.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation
import FirebaseAuth

class MainScreenViewModel:ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
           
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""

            }
        }
        
    }

 
    
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
