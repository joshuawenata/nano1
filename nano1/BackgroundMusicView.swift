//
//  BackgroundMusicView.swift
//  nano1
//
//  Created by Michelle Chau on 23/04/24.
//

import SwiftUI

struct BackgroundMusicView: View {
    
    @State var width: Double = 20
    @State var height: Double = 110

    var body: some View {
        
        HStack() {
            Image(systemName: "wind.snow")
                .resizable()
                .frame(width: 35, height: 25)
            
            Text("Snowing")
                .bold()
                .font(.largeTitle)
                .padding(.trailing, 40)
            
            Slider(value: $width, in: 0...100)
                .frame(width: 600, height: 70)
                .padding(.trailing, 15)
           
            Image(systemName: "speaker.wave.3.fill")
                .resizable()
                .frame(width: 35, height: 25)
            
            
        }.padding()
        
        
        
    }
}

#Preview {
    BackgroundMusicView()
}
