import SwiftUI

@main
struct nano1App: App {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismiss) private var dismiss
    
    @State var showImmersiveSpace = false
    @State var immersiveSpaceIsShown = false
    @State var setSpace: String = ""
    @State var bgMusic: String = ""
    @State var immersiveSpaceId: String = ""
    @State var style: ImmersionStyle = .full
    
    var body: some Scene {
        WindowGroup(id: "Main") {
            ContentView(showImmersiveSpace: $showImmersiveSpace,
                        immersiveSpaceIsShown: $immersiveSpaceIsShown,
                        setSpace: $setSpace,
                        bgMusic: $bgMusic,
                        immersiveSpaceId: $immersiveSpaceId)
        }
        
        ImmersiveSpace(id: "WinterForestSpace") {
            ImmersiveView(skyboxAssets: "winter_forest", bgMusic: "winter_forest", object: StaticObject(name: "Deer").makeEntity()!, sceneShowing: "winterForest")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MagicNightSpace") {
            ImmersiveView(skyboxAssets: "magic_night", bgMusic: "magic_night", object: StaticObject(name: "Bird").makeEntity()!, sceneShowing: "magicNight")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "MountainCloudSpace") {
            ImmersiveView(skyboxAssets: "mountain_cloud", bgMusic: "mountain_cloud", object: StaticObject(name: "Dragon").makeEntity()!, sceneShowing: "mountainCloud")
        }
        .immersionStyle(selection: $style, in: .full)
        
        ImmersiveSpace(id: "BeachSpace") {
            ImmersiveView(skyboxAssets: "beach", bgMusic: "beach", object: StaticObject(name: "Bird").makeEntity()!, sceneShowing: "beach")
        }
        .immersionStyle(selection: $style, in: .full)
    }
}
