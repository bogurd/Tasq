//
//  DifficultySelectionScene.swift
//  Tasq
//
//  Created by George Katsikas on 29/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit
import UIKit

class DifficultySelectionScene: SKScene {
    var selectedDifficulty: GameDifficulty = .normal
    
    override func didMove(to view: SKView) {
        let newGameTitle = SKLabelNode(text: "New Game")
        newGameTitle.fontSize = 52
        newGameTitle.position = centerOfScreen.applying(CGAffineTransform.init(translationX: 0, y: screenHeight*CGFloat(3)/CGFloat(8)))
        self.addChild(newGameTitle)
        
        for (i, difficulty) in GameDifficulty.allCases.enumerated() {
            let difficultyButton = SKLabelNode(text: "\(difficulty)".capitalized)
            difficultyButton.name = "\(difficulty)DiffButton"
            difficultyButton.fontSize = 32
            difficultyButton.position = newGameTitle.position.applying(
                CGAffineTransform.init(
                    translationX: 0,
                    y: -0.5*CGFloat(i+2)*screenHeight/CGFloat(GameDifficulty.allCases.count)
                )
            )
            self.addChild(difficultyButton)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        guard let touchedNode = nodes(at: touch.location(in: self)).first else { return }
        guard let touchedNodeName = touchedNode.name else { return }
        guard let view = self.view else { return }

        if touchedNodeName.contains("DiffButton") {
            switch touchedNodeName {
            case "easyDiffButton":
                self.selectedDifficulty = .easy
            case "normalDiffButton":
                self.selectedDifficulty = .normal
            case "hardDiffButton":
                self.selectedDifficulty = .hard
            case "extremeDiffButton":
                self.selectedDifficulty = .extreme
            case "ultraDiffButton":
                self.selectedDifficulty = .ultra
            default:
                break
            }
            
            let scene = GameScene(size: UIScreen.main.bounds.size,
                                  difficulty: self.selectedDifficulty)
            scene.scaleMode = .aspectFit
            view.presentScene(scene, transition: rightPushTransition)
        }
        
        

        
        

        
//        let scene = GameScene(size: UIScreen.main.bounds.size, difficulty: selectedDifficulty)
        
    }
}
