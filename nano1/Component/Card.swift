//
//  Card.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 24/04/24.
//

import SwiftUI

struct Card: View {
    var card: CardModel
    
    var body: some View {
        HStack(alignment: .center) {
            
            ZStack {
                VStack {
                    Image(card.image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                }
                
                Button(action: {
                    card.action()
                }, label: {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 50))
                })
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .shadow(radius: 5)
    }
}
