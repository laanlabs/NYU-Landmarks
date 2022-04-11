//
//  ContentView.swift
//  NYU-Landmarks
//
//  Created by jclaan on 4/8/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ARViewContainer()
            
            ControlView()
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let anchor = try! HuluPorcelain.loadHulu()
        
        // Add to the scene
        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
#endif
