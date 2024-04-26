//
//  Card.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 24/04/24.
//

import SwiftUI

struct Card: View {
    var card: CardModel
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @State private var setSpace = ""

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        HStack(alignment: .center) {
            
            ZStack {
                VStack {
                    Image(card.image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                }
                .padding()
                
                Button(action: {
                    card.action()
                }, label: {
                    Image(systemName: "play.circle")
                        .font(.system(size: 50))
                })
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .padding(20)
        .background(Color.white.opacity(0.2))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
