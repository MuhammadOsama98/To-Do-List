//
//  ToDoListItemScreenViewModel.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemScreenViewModel:ObservableObject{
    init(){
        
    }
    
    
    func toggleIsDone(item:ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos")
            .document(itemCopy.id).setData(itemCopy.asDictionary())
        
    }
}
