//
//  wwwww.swift
//  To Do List
//
//  Created by Pillars Fintech on 05/09/2023.
//

import SwiftUI

struct wwwww: View {

    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField("Placeholder", text: $text)
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                            Text(placeholder)
                                .foregroundColor(.gray)
                                .padding(2)
                                .background()
                                .frame(maxWidth: .infinity,
                                       maxHeight: .infinity,
                                       alignment: .topLeading)
                            
                                .offset(x: 20, y: -10)
                        }
                    }
        
    }

                
    
}

struct wwwww_Previews: PreviewProvider {
    static var previews: some View {
        wwwww(placeholder: "placeholder", text: .constant("text") )
    }
}
