//
//  3DModel.swift
//  nano1
//
//  Created by Joshua Wenata Sunarto on 25/04/24.
//

import SwiftUI
import RealityKit

struct Object: View {
    var name: String
    var size: Float = 1.0
    
    var body: some View {
        Model3D(named: name) { element in
            element
                .aspectRatio(contentMode: .fit)
                .scaleEffect(CGFloat(size))
        } placeholder: {
            ProgressView()
                .padding()
        }
    }
}
