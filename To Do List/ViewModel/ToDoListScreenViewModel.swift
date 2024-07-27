//
//  ToDoListScreenViewModel.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation
import FirebaseFirestore

class ToDoListScreenViewModel:ObservableObject{
    @Published var showingNewItemView = false
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
