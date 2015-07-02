//
//  BoardNode.swift
//  Tasq
//
//  Created by George Katsikas on 6/21/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import Foundation
import SpriteKit



class BoardNode: SKNode{
    //Sweet Sweet Singleton
//    class var sharedNode : BoardNode {
//        struct Singleton {
//            static let instance = BoardNode()
//        }
//        return Singleton.instance
//    }
    
    static var sharedNode = BoardNode()
    
    var boardSize = Int()
    var board = Array<Array<Light>>()
    
    var boardArea = SKShapeNode()
    var rect = CGRect(origin: CGPointZero, size: CGSize(width: screenSize.width*borderScale, height: screenSize.width*borderScale))
    
    
    override init(){
        super.init()
        boardArea.path = CGPathCreateWithRoundedRect(rect, 10.0, 10.0, nil)
        boardArea.fillColor = boardColor
        boardArea.lineWidth = 0
        boardArea.position.y += (screenSize.height-screenSize.width)/2
        boardArea.position.x += (screenSize.width-screenSize.width*borderScale)/2.0
        
        boardSize = 2*difficulty.rawValue+1
    }
    
    

    func fillBoard(){
        for x in 1...boardSize {
            
            //array with a light column
            var lightColumn = [Light]()
            
            for y in 1...boardSize {
                
                //Create a light object and put it inside the column/board                
                var light = Light(position: (x,y))
                lightColumn.append(light)
                //println("appended Light of position \(light.positionInBoard)")
                
            }
            
            //place the row into the board
            board.append(lightColumn)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func shuffle(){
        for i in 1...100{
            let x = arc4random()%UInt32(self.boardSize)
            let y = arc4random()%UInt32(self.boardSize)
            
            self.touched(Int(x)+1,y: Int(y)+1)
        }
    }
    
    func touched(x: Int, y: Int){
        var max = BoardNode.sharedNode.boardSize
        //convert conventional counting to array places
        var x = x
        var y = y
        if x != 0 && y != 0{
            x -= 1
            y -= 1
        }
        max -= 1
        
        self.board[x][y].toggle()
        
        //Check if the adjacent lights exist and toggle them (couldn't think of a better way to do it)
        if x-1>=0{
            self.board[x-1][y].toggle()
        }
        if x+1<=max{
            self.board[x+1][y].toggle()
        }
        if y-1>=0{
            self.board[x][y-1].toggle()
        }
        if y+1<=max{
            self.board[x][y+1].toggle()
        }
        
    }
    
    func checkIfWon(){
        var lightsAreOn = true
        for x in 0...boardSize-1 {
            var isColumnOn = true
            for y in 0...boardSize-1 {
                isColumnOn = isColumnOn && self.board[x][y].isOn
            }
            lightsAreOn = lightsAreOn && isColumnOn
        }
        
        if lightsAreOn {
            for lightRow in BoardNode.sharedNode.board{
                for light in lightRow{
                    light.fillColor = lightColorWon
                }
            }
        }
    }
}
