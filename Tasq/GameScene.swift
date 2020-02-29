//
//  GameScene.swift
//  Tasq
//
//  Created by George Katsikas on 27/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var difficulty: GameDifficulty = .normal
    
    init(size: CGSize, difficulty: GameDifficulty){
        super.init(size: size)
        self.difficulty = difficulty
    }
    
    override func didMove(to view: SKView) {
        let board = Board(boardSize: self.difficulty.rawValue)
        board.setScale(0.95)
        board.position = centerOfScreen
        self.addChild(board)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        guard let scene = scene else {
//            print("error with scene")
//            return
//        }
//        guard let touch = touches.first else {
//            print("error with touch")
//            return
//        }
//        
//        let l = Light.init(size: 50)
//        l.position = touch.location(in: scene)
//        print(touch.location(in: scene))
//        self.addChild(l)
//    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
