//
//  Button.swift
//  Tasq
//
//  Created by George Katsikas on 03/03/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import SpriteKit

class Button: SKShapeNode {
    var label: SKLabelNode?
    var icon: SKSpriteNode?
    var tapCallback: () -> ()
    
    override var isUserInteractionEnabled: Bool {
        set {
            // ignore
        }
        get {
            return true
        }
    }
    
    init(text: String? = nil, iconName: String? = nil, tapCallback: @escaping () -> ()) {
        self.tapCallback = tapCallback
        super.init()

        var buttonWidth: CGFloat = 0
        var buttonHeight: CGFloat = 0
        if let text = text {
            self.label = SKLabelNode(text: text)
            self.label?.verticalAlignmentMode = .center
            guard let frame = self.label?.frame else { return }
            buttonHeight = (buttonHeight == 0) ? frame.height : buttonHeight
            buttonWidth += frame.width
        }
        
        if let iconName = iconName {
            self.icon = SKSpriteNode(imageNamed: iconName)
            buttonHeight = (buttonHeight == 0) ? self.icon?.frame.height ?? 0 : buttonHeight
            buttonWidth += self.icon?.frame.width ?? 0
            self.icon?.scale(to: CGSize(width: buttonHeight, height: buttonHeight))
        }
        
        let buttonSize = CGSize(width: buttonWidth + borderPerc*25,
                                height: buttonHeight + borderPerc*25)
        var centerTransform = CGAffineTransform(translationX: -0.5*buttonSize.width,
                                                y: -0.5*buttonSize.height)
        self.path = CGPath(
            roundedRect: CGRect(origin: CGPoint.zero, size: buttonSize),
            cornerWidth: screenWidth/40,
            cornerHeight: screenWidth/40,
            transform: &centerTransform
        )
        self.fillColor = SKColor.clear
        self.strokeColor = SKColor.white
        
        if self.label != nil {
            self.label?.position = self.position
            self.addChild(self.label!)
        }
        if self.icon != nil {
            self.icon?.position = self.position
            self.addChild(self.icon!)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tapCallback()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
