//
//  Board.swift
//  Tasq
//
//  Created by George Katsikas on 28/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class Board: SKShapeNode{
    var lights: [[BoardLight]]
    var boardSize: Int
    var centerTransform = CGAffineTransform.init(translationX: -0.5*screenWidth,
                                                 y: -0.5*screenWidth)
    
    init(boardSize: Int) {
        self.lights = []
        self.boardSize = boardSize
        let lightOffset = (self.boardSize-1)/2
        let lightBorderFactor = 1.0 + CGFloat(self.boardSize)/CGFloat(self.boardSize+1)*(1/borderPerc-1.0)
        super.init()
        
        self.path = CGPath(
            roundedRect: CGRect(origin: CGPoint.zero, size: boardShapeSize),
            cornerWidth: screenWidth/40,
            cornerHeight: screenWidth/40,
            transform: &centerTransform
        )
        self.fillColor = SKColor.blue
        self.strokeColor = SKColor.clear

        for i in 0..<self.boardSize {
            var lightCol = [BoardLight]()
            for j in 0..<self.boardSize {
                let light =  BoardLight(size: borderPerc*screenWidth/CGFloat(self.boardSize),
                                   gridPosition: (i,j))
                light.position = CGPoint(
                    x:CGFloat(i-lightOffset)*light.size*lightBorderFactor,
                    y:CGFloat(j-lightOffset)*light.size*lightBorderFactor
                )
                lightCol.append(light)
                self.addChild(light)
            }
            self.lights.append(lightCol)
        }
    }
    
    func toggleLights(gridPosition: (Int,Int)){
        let i = gridPosition.0
        let j = gridPosition.1
        let lightCross = [(i,j), (i+1,j), (i-1,j), (i,j+1), (i,j-1)]
        for light in lightCross {
            if 0<=light.0 && light.0<lights.count && 0<=light.1 && light.1<lights.count {
                self.lights[light.0][light.1].toggle()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
