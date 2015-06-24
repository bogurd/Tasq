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
        //loop through
        
    }
    
    

    func fillBoard(){
        for x in 1...boardSize {
            
            //array with a light row
            var lightColumn = [Light]()
            
            for y in 1...boardSize {
                
                //Calculate the box size (one dimension, it's a square so it doesn't matter)
                
                //Create a light object and put the boolvalue inside the column/board (unsure if it copies or references, ideally, it should reference)
                
                var light = Light(position: (x,y))
                lightColumn.append(light)
                //println("appended Light of position \(light.positionInBoard)")
                
                
                //
                //TODO
                //
                //make the curve a function of boardSize
                
                //Assinging the position to the light node
            }
            
            //place the row into the board
            board.append(lightColumn)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //getDeviceWidth = width = height
    //position = (width/2,height/2)

    
}

//Temp Math Section

//boxsize = (whole - 2*border*whole - (size-1)*margin*whole)/boardSize
//
//Rxpos = border*whole + ((x-1)*boxsize) + (x-1)*margin*whole + boxsize/2
//Rypos = border*whole + ((y-1)*boxsize) + (y-1)*margin*whole + boxsize/2
//
//xpos = Rxpos
//ypos = Rypos + ((height-whole)/2)