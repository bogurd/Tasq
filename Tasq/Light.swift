//
//  Light.swift
//  Tasq
//
//  Created by George Katsikas on 28/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class Light: SKShapeNode {
    
    var switchedOn: Bool = false
    var size: CGFloat
    
    override var isUserInteractionEnabled: Bool {
        set {
            // ignore
        }
        get {
            return true
        }
    }
    
    init(size: CGFloat) {
        var centerTransform = CGAffineTransform.init(translationX: -0.5*size, y: -0.5*size)
        self.size = size
        
        super.init()
        self.path = CGPath.init(
            roundedRect:
                CGRect(origin: CGPoint.zero,
                       size: CGSize.init(width: size, height: size)),
            cornerWidth: size/10,
            cornerHeight: size/10,
            transform: &centerTransform
        )
        self.fillColor = lightOffColor
        self.strokeColor = SKColor.clear
        
        if debugMode {
            let tapCounter = SKLabelNode.init(text: "0")
            tapCounter.name = "tapCounter"
            tapCounter.verticalAlignmentMode = .center
            self.addChild(tapCounter)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggle() {
        self.switchedOn = !self.switchedOn
        if self.switchedOn {
            self.fillColor = lightOnColor
        } else {
            self.fillColor = lightOffColor
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        
        self.toggle()
    }
}

class BoardLight: Light {
    var gridPosition: (Int,Int)
    
    init(size: CGFloat, gridPosition: (Int,Int)){
        self.gridPosition = gridPosition
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let tapCounter = self.childNode(withName: "tapCounter") as! SKLabelNode?{
            tapCounter.text = String(Int(tapCounter.text!)! + 1)
        }
        
        if let board: Board = self.parent as? Board {
            board.toggleLights(gridPosition: self.gridPosition)
        }
    }
}
