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

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            println(location)
            
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
