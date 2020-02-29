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
    var gridPosition: (Int,Int)?
    
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
    }
    
    convenience init(size: CGFloat, gridPosition: (Int,Int)){
        self.init(size: size)
        self.gridPosition = gridPosition
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
        if let board: Board = self.parent as? Board {
            board.toggleLights(gridPosition: self.gridPosition!)
        }
    }
}
