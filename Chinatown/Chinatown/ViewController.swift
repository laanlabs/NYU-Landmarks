//
//  ViewController.swift
//  Chinatown
//
//  Created by Cleo Xiao on 4/10/22.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        let audioFilePath = "/relaxing-ambient-music.wav"
        let entity = Entity()
        
        do {
            let resource = try AudioFileResource.load(named: audioFilePath, in: nil, inputMode: .spatial, loadingStrategy: .preload, shouldLoop: true)
            
            let audioController = entity.playAudio(resource)
            audioController.play()
            
        } catch {
            print("Error loading audio file")
        }
    }
}
