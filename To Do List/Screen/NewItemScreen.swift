//
//  NewItemScreen.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct NewItemScreen: View {
    @StateObject var viewModel = NewItemScreenViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        
        VStack{
            Text("New Item").font(.system(size: 32)).bold().padding(.top,100)
            
            Form{
                TextField("Title", text: $viewModel.title).textFieldStyle (DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: [.pink]) {
                
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        
                        viewModel.showAlart = true
                    }

                }.padding()
                
            }
            .alert(isPresented: $viewModel.showAlart) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))

            }
        }

    }
}

struct NewItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewItemScreen(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}



