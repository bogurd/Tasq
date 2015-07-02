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
        self.positionInBoard = position
        super.init()
        self.name = "Light"
        //Expression to calculate the size of the box
        let borders = 2.0 * borderFraction
        let margins = Double((BoardNode.sharedNode.boardSize-1)) * marginFraction
        let boxSizeFactor = 1.0 - borders - margins
        let boxSize = (boxSizeFactor/Double(BoardNode.sharedNode.boardSize))*Double(screenSize.width)
        //Expression to calculate actual position on the device screen, had to split up
        let deltaX = Double(position.x-1)
        let deltaY = Double(BoardNode.sharedNode.boardSize-position.y)
        var xpos = border + deltaX*boxSize + deltaX*margin
        var ypos = border + deltaY*boxSize + deltaY*margin
        xpos += (Double(borderScale-1)*Double(screenSize.width))/2
        ypos += (Double(borderScale-1)*Double(screenSize.width))/2
        //Actually not sure if ypos is perfectly centered, will have to see. 
        
        var lightRect = CGRect(origin: CGPoint(x: xpos, y: ypos), size: CGSize(width: boxSize, height: boxSize))
        self.path = CGPathCreateWithRoundedRect(lightRect, 2.0, 2.0, nil)
        
        self.fillColor = lightColorOff
        self.lineWidth = 0
        
        BoardNode.sharedNode.boardArea.addChild(self)
        
        
        //TempLabeling
        if debug{
            let label = SKLabelNode(text: "x:\(self.positionInBoard.x),y:\(self.positionInBoard.y)")
            label.position = CGPoint(x: xpos + boxSize/2, y: ypos + boxSize/2)
            label.fontSize = 7.0
            BoardNode.sharedNode.boardArea.addChild(label)
        }

    }

   
    
    func toggle(){
        self.isOn = !self.isOn
        
        if self.isOn{
            self.fillColor = lightColorOn
        }else{
            self.fillColor = lightColorOff
        }
    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            println("touched a light or nah?")
            
            //            let light = Light(position: (1, 3), boxSize: CGSize(width: 50, height: 50))
            //            light.position = location
            //            println("made light at \(location)")
            //            BoardNode().boardArea.addChild(light)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}