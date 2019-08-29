//
//  ViewController.swift
//  ARUITest
//
//  Created by Peter Pohlmann on 27.08.19.
//  Copyright © 2019 Peter Pohlmann. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI
import Combine


class ViewController: UIViewController, ARSCNViewDelegate {
    let navControll = NaVController()
  
    @IBOutlet var sceneView: ARSCNView!
    
    @IBAction func testAction(_ sender: Any) {
      navControll.test = "x"
    }
  override func viewDidLoad() {
        super.viewDidLoad()
        
   
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
      
        // SwiftUI
      
      let swiftUi = UIHostingController(rootView: SwiftUITest1(navController: navControll))
        
      self.addChild(swiftUi)
      self.view.addSubview(swiftUi.view)
      
      swiftUi.view.frame = CGRect( x:0, y: self.view.frame.height - 400, width: self.view.frame.width, height: 200)
      
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
