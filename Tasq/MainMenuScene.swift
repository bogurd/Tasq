//
//  MainMenuScene.swift
//  Tasq
//
//  Created by George Katsikas on 29/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit
import UIKit

class MainMenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        let title = SKLabelNode(text: "Tasq")
        title.fontSize = 100
        title.position = centerOfScreen.applying(CGAffineTransform.init(translationX: 0, y: screenHeight/4))
        self.addChild(title)
        
        let newGameButton = SKLabelNode(text: "New Game")
        newGameButton.name = "newGameButton"
        newGameButton.fontSize = 52
        newGameButton.position = centerOfScreen
        self.addChild(newGameButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let touchedNode = nodes(at: touch.location(in: self)).first else { return }
        guard let view = self.view else { return }
        
        if touchedNode.name == "newGameButton" {
            let scene = DifficultySelectionScene(size: UIScreen.main.bounds.size)
            scene.scaleMode = .aspectFit
            view.presentScene(scene, transition: rightPushTransition)
        }
    }
    
}
