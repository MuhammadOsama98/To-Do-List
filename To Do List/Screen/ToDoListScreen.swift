//
//  ToDoListScreen.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListScreen: View {
    @StateObject var viewModel : ToDoListScreenViewModel
    @FirestoreQuery var items: [ToDoListItem]

    private let userId: String
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery.init(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListScreenViewModel(userId: userId))
    }
    var body: some View {
        
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemScreen(item: item).swipeActions {
                   
                        Button("Delete") {
                            viewModel.delete(id: item.id)
                        }.tint(.red)
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List Screen")

            .toolbar{
                Button{
                   //action
                    viewModel.showingNewItemView = true
                }label: {
                    Image (systemName: "plus")
                }
            }
            .sheet(isPresented:  $viewModel.showingNewItemView) {
                NewItemScreen(newItemPresented: $viewModel.showingNewItemView)
                
              
                
                
            }
        }
        
    }
}

struct ToDoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListScreen(userId: "")
    }
}

