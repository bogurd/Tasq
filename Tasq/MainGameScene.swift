//
//  MainGameScene.swift
//  Tasq
//
//  Created by George Katsikas on 03/03/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class MainGameScene: GameScene {
    var difficulty: GameDifficulty = .normal
    
    init(previousScene: SKScene, difficulty: GameDifficulty){
        self.difficulty = difficulty
        super.init(size: UIScreen.main.bounds.size, previousScene: previousScene)
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
}
