//
//  Light.swift
//  Tasq
//
//  Created by George Katsikas on 6/21/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import Foundation
import SpriteKit

class Light: SKShapeNode{
    var positionInBoard: (x: Int, y: Int)
    var isOn:Bool = false
    
    init(position: (x: Int, y: Int)){
        positionInBoard = position
        super.init()
        
        //Expression to calculate the size of the box
        let borders = 2.0 * borderFraction
        println("borders done")
        println("singleton size is \(BoardNode.sharedNode.boardSize)")
        let margins = Double((BoardNode.sharedNode.boardSize-1)) * marginFraction
        println("margins done")
        let boxSizeFactor = 1.0 - borders - margins
        println("boxfactor done")
        let boxSize = (boxSizeFactor/Double(BoardNode.sharedNode.boardSize))*Double(screenSize.width)
        println("boxsize done")
        //Expression to calculate actual position on the device screen, had to split up
        let deltaX = Double(position.x-1)
        println("deltax done")
        let deltaY = Double(BoardNode.sharedNode.boardSize-position.y)
        println("deltay done")
        var xpos = border + deltaX*boxSize + deltaX*margin
        println("xpos done")
        var ypos = border + deltaY*boxSize + deltaY*margin
        println("ypos done")
        xpos += (Double(borderScale-1)*Double(screenSize.width))/2
        ypos += (Double(borderScale-1)*Double(screenSize.width))/2
        
        var lightRect = CGRect(origin: CGPoint(x: xpos, y: ypos), size: CGSize(width: boxSize, height: boxSize))
        self.path = CGPathCreateWithRoundedRect(lightRect, 2.0, 2.0, nil)
        println("rect+path done")
        
        self.fillColor = bgColor
        self.lineWidth = 0
        
        BoardNode.sharedNode.boardArea.addChild(self)
        println("child done")
    }

   
    
    func toggle(){
        self.isOn = !self.isOn
        //self.color = nil //something in the future
    }
    
//    func touched(){
//        let x = positionInBoard.x
//        let y = positionInBoard.y
//        
//        self.toggle()
//        //BoardNode().board[x+1][y+1].toggle()
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}