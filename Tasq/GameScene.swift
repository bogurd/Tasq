//
//  GameScene.swift
//  Tasq
//
//  Created by George Katsikas on 6/21/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = bgColor
        
        //BoardNode()
//        println("singleton size is \(BoardNode.sharedNode.boardSize)")
        self.addChild(BoardNode.sharedNode.boardArea)
        BoardNode.sharedNode.fillBoard()
        
        //Back Button Implementation
//        let backButton = SKLabelNode(text: "Back")
//        backButton.position = screenCenter
//        backButton.position.y += screenSize.height/2-30
//        backButton.fontSize = 18
//        backButton.fontColor = UIColor.whiteColor()
//        backButton.name = "backButton"
//        self.addChild(backButton)
//        
        let shuffleButton = SKSpriteNode(imageNamed: "shuffleButton")
        let shuffleButtonBackground = SKShapeNode(rectOfSize: shuffleButton.size, cornerRadius: 6)
        shuffleButton.position = topLine
        shuffleButton.position.x = screenSize.width-BoardNode.sharedNode.boardArea.position.x-CGFloat(border)*2
        shuffleButton.runAction(SKAction.colorizeWithColor(lightColorOff, colorBlendFactor: 1, duration: 0))
        shuffleButton.xScale /= 2
        shuffleButton.yScale /= 2
        shuffleButtonBackground.fillColor = lightColorOn
        shuffleButtonBackground.lineWidth = 0
        shuffleButtonBackground.position = shuffleButton.position
        shuffleButtonBackground.name = "shuffleButton"
        self.addChild(shuffleButton)
        self.addChild(shuffleButtonBackground)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let spriteTouched = self.nodeAtPoint(location)
            
            if spriteTouched.name == "Light" {
                let light = spriteTouched as! Light
                BoardNode.sharedNode.touched(light.positionInBoard.x, y: light.positionInBoard.y)
                BoardNode.sharedNode.checkIfWon()
            }else if spriteTouched.name == "backButton" {
                
            }else if spriteTouched.name == "shuffleButton" {
                BoardNode.sharedNode.shuffle()
            }
            
//            let light = Light(position: (1, 3), boxSize: CGSize(width: 50, height: 50))
//            light.position = location
//            println("made light at \(location)")
//            BoardNode().boardArea.addChild(light)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

