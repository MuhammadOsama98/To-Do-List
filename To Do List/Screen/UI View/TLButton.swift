//
//  TLButton.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: [Color]
    let action:()->Void
    
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(colors:background, startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                
                Text (title)
                .foregroundColor (Color.white)
                .bold ()
                
            }
        }
        
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "", background: [.blue,.blue], action: {
            
        })
    }
}
