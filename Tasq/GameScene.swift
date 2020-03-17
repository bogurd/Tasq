//
//  GameScene.swift
//  Tasq
//
//  Created by George Katsikas on 27/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var previousScene: SKScene?
    
    init(size: CGSize, previousScene: SKScene? = nil){
        super.init(size: size)
        self.previousScene = previousScene
        
        if self.previousScene != nil {
            let backButton = Button(text: "Back", tapCallback: transitionToPreviousScene)
            backButton.setScale(0.75)
            backButton.position = topLeft + backButton.frame.bottomRight + 20*unitVec(-1*Double.pi/4)
            self.addChild(backButton)
        }
        
        self.backgroundColor = gameBackgroundColor
    }
    
    func transitionToPreviousScene() {
        guard let view = self.view else { return }
        if let scene = self.previousScene {
            scene.scaleMode = .aspectFit
            view.presentScene(scene, transition: leftPushTransition)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
