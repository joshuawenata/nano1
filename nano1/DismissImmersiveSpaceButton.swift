//
//  DismissImmersiveSpaceButton.swift
//  nano1
//
//  Created by Michelle Chau on 23/04/24.
//

import SwiftUI

struct DismissImmersiveSpaceButton: View {
    @Environment(\.dismissImmersiveSpace)
       private var dismissImmersiveSpace
    var body: some View {
        
        Button("Close Space") {
                    Task {
                        await dismissImmersiveSpace()
                    }
                }
        
    }
}

#Preview {
    DismissImmersiveSpaceButton()
}
