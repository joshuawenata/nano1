//
//  immersiveModel.swift
//  nano1
//
//  Created by Luthfi Misbachul Munir on 25/04/24.
//

import Foundation

struct immersiveModel: Identifiable {
    var id: String
    var skybox: String
    var bgMusic: String
}

let immersiveDummy: [immersiveModel] = [
    immersiveModel(id: "WinterForestSpace", skybox: "winter_forest", bgMusic: "everest"),
    immersiveModel(id: "MagicNightSpace", skybox: "magic_night", bgMusic: "music1"),
]
