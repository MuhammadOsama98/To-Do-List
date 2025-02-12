//
//  NewItemScreenViewModel.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemScreenViewModel:ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlart = false

    
    init(){
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uId).collection("todos").document(newId).setData(newItem.asDictionary())
        
    }
    
    var canSave:Bool{
        guard !title.trimmingCharacters (in: .whitespaces) .isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86488) else{
            return false
        }
        
        
        return true
        
    }
}
