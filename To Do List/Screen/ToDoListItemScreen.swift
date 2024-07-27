//
//  ToDoListItemScreen.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct ToDoListItemScreen: View {
    @StateObject var viewModel = ToDoListItemScreenViewModel()
    let item: ToDoListItem
    var body: some View {
  
        HStack{
            VStack(alignment: .leading){
                
                Text(item.title).font(.body).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(.secondary)

            }
            
            Spacer()
            
            
            
            
            Button{
                
                viewModel.toggleIsDone(item: item)
                
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle").foregroundColor(Color.blue)
            }

        }
        
    }
}

struct ToDoListItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemScreen(item: .init(id: "123", title: "fet for word", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
