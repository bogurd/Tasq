//
//  GameViewController.swift
//  Tasq
//
//  Created by George Katsikas on 27/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = MainMenuScene(size: UIScreen.main.bounds.size)
            scene.scaleMode = .aspectFit
            view.presentScene(scene)
        }
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
