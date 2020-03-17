//
//  SettingsScene.swift
//  Tasq
//
//  Created by George Katsikas on 17/03/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit
import UIKit

class SettingsScene: GameScene {
    
    init(previousScene: SKScene) {
        super.init(size: UIScreen.main.bounds.size, previousScene: previousScene)
    }
    
    override func didMove(to view: SKView) {
        let settingsTitle = SKLabelNode(text: "Settings")
        settingsTitle.fontSize = 52
        settingsTitle.position = centerOfScreen + (0,screenHeight/4)
        self.addChild(settingsTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
