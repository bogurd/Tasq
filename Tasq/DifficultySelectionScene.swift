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
    
    override func didMove(to view: SKView) {
        let newGameTitle = SKLabelNode(text: "New Game")
        newGameTitle.fontSize = 52
        newGameTitle.position = centerOfScreen + (0,screenHeight/4)
        self.addChild(newGameTitle)
        
        for (i, difficulty) in GameDifficulty.allCases.enumerated() {
            let difficultyButton = Button(text: "\(difficulty)".capitalized,
               tapCallback: {return self.createGameWithDifficulty(difficulty: difficulty)}
            )
            difficultyButton.position = newGameTitle.position  + (0,-0.5*CGFloat(i+1)*screenHeight/CGFloat(GameDifficulty.allCases.count))
            self.addChild(difficultyButton)
        }
    }
    
    func createGameWithDifficulty(difficulty: GameDifficulty) -> () {
        guard let view = self.view else { return }
        let scene = GameScene(size: UIScreen.main.bounds.size,
                              difficulty: difficulty)
        scene.scaleMode = .aspectFit
        view.presentScene(scene, transition: rightPushTransition)
    }
    
}
