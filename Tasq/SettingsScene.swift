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
        
        let randomColorsButton = Button(text: "Randomize Colors!", tapCallback: randomizeColors)
        randomColorsButton.position = centerOfScreen
        self.addChild(randomColorsButton)
    }
    
    func randomizeColors() {
        // EXTREMELY UGLY SOLUTION, don't mind me...
        let randomHueOffset = CGFloat.random(in: 0...1)
        gameBackgroundColor = gameBackgroundColor.tweakHue(hue: randomHueOffset)
        lightOnColor = lightOnColor.tweakHue(hue: randomHueOffset)
        lightOffColor = lightOffColor.tweakHue(hue: randomHueOffset)
        boardColor = boardColor.tweakHue(hue: randomHueOffset)
        
        // No idea how to make this better right now, I need not inform anyone the colors are changed...
        self.backgroundColor = gameBackgroundColor
        self.previousScene?.backgroundColor = gameBackgroundColor
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
