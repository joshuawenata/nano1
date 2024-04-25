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
        HStack {
            Image(card.image)
                .resizable()
                .padding()
                .frame(width: 200, height: 200)
                .border(Color.white, width: 20)
            
            VStack {
                Button(action: {
                    card.action()
                }, label: {
                    Text("Show Immersive Space")
                })
            }
            .padding(.leading, 50)
            .frame(width: 400)
        }
        .padding(20)
        .background(Color.white.opacity(0.2))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
