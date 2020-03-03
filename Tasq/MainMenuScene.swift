//
//  MainMenuScene.swift
//  Tasq
//
//  Created by George Katsikas on 29/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit
import UIKit

class MainMenuScene: GameScene {
    
    init() {
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        let title = SKLabelNode(text: "Tasq")
        title.fontSize = 100
        title.position = centerOfScreen.applying(CGAffineTransform.init(translationX: 0, y: screenHeight/4))
        self.addChild(title)
    
        let newGameButton = Button(text: "New Game", tapCallback: selectDifficulty)
        newGameButton.position = centerOfScreen
        self.addChild(newGameButton)
    }
    
    func selectDifficulty() {
        guard let view = self.view else { return }
        let scene = DifficultySelectionScene(previousScene: self)
        scene.scaleMode = .aspectFit
        view.presentScene(scene, transition: rightPushTransition)
    }
    
}
