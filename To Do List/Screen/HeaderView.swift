//
//  HeaderView.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {

        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background).rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title).foregroundColor(.white).font(.system(size: 50)).bold()
                Text(subtitle).foregroundColor(.white).font(.system(size: 30)).bold()
            }.padding(.top,80)
            
        }.frame(width: UIScreen.main.bounds.width * 3 ,height: 350)
            .offset(y: -150)

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "", subtitle: "", angle: 15, background: .blue)
    }
}
