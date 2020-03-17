//
//  Constants.swift
//  Tasq
//
//  Created by George Katsikas on 28/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import UIKit
import SpriteKit

let debugMode = true

let rightPushTransition = SKTransition.push(with: .left, duration: 0.5)
let leftPushTransition = SKTransition.push(with: .right, duration: 0.5)

var screenSize = UIScreen.main.bounds
var screenHeight = screenSize.height
var screenWidth = screenSize.width

var centerOfScreen = CGPoint.init(x: screenWidth/2, y: screenHeight/2)
var topLeft = CGPoint.init(x: 0, y: screenHeight)
var topRight = CGPoint.init(x: screenWidth, y: screenHeight)
var bottomLeft = CGPoint(x: 0, y: 0)
var bottomRight = CGPoint(x: screenWidth, y: 0)

var boardShapeSize = CGSize(width: screenWidth, height: screenWidth)

var borderPerc: CGFloat = 0.85

var lightOnColor = SKColor.init(named: "lightOnColor") ?? SKColor.white
var lightOffColor = SKColor.init(named: "lightOffColor") ?? SKColor.black
var boardColor = SKColor.init(named: "boardColor") ?? SKColor.blue
var gameBackgroundColor = SKColor.init(named: "backgroundColor") ?? SKColor.darkGray
var colorsArray: [SKColor] = [lightOnColor, lightOffColor, boardColor, gameBackgroundColor]

enum GameDifficulty: Int, CaseIterable {
    case easy = 3
    case normal = 5
    case hard = 7
    case extreme = 9
    case ultra = 11
}

var unitVec = { angle in
    return CGPoint(x: CGFloat(cos(angle as Double)),
                   y: CGFloat(sin(angle as Double))
    )
}

extension CaseIterable where Self: RawRepresentable {
    static var AllValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}

func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func *(left: CGFloat, right: CGPoint) -> CGPoint {
    return CGPoint(x: left*right.x, y: left*right.y)
}

func +(left: CGPoint, right: (CGFloat,CGFloat)) -> CGPoint {
    return CGPoint(x: left.x + right.0, y: left.y + right.1)
}

func *(left: CGFloat, right: (CGFloat,CGFloat)) -> CGPoint {
    return CGPoint(x: left*right.0, y: left*right.1)
}

extension CGRect {
    var topLeft: CGPoint {
        return CGPoint(x: -0.5*self.width, y: 0.5*self.height)
    }
    var topRight: CGPoint {
        return CGPoint(x: 0.5*self.width, y: 0.5*self.height)
    }
    var bottomLeft: CGPoint {
        return CGPoint(x: -0.5*self.width, y: -0.5*self.height)
    }
    var bottomRight: CGPoint {
        return CGPoint(x: 0.5*self.width, y: -0.5*self.height)
    }
}

extension UIColor {

     func tweak(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> UIColor {

        var currentHue: CGFloat = 0.0
        var currentSaturation: CGFloat = 0.0
        var currentBrigthness: CGFloat = 0.0
        var currentAlpha: CGFloat = 0.0

        if self.getHue(&currentHue, saturation: &currentSaturation, brightness: &currentBrigthness, alpha: &currentAlpha) {
            return UIColor(hue: currentHue + hue,
                           saturation: currentSaturation + saturation,
                           brightness: currentBrigthness + brightness,
                           alpha: currentAlpha + alpha)
        } else {
            return self
        }
    }
    
    func tweakHue(hue: CGFloat) -> UIColor {
        return tweak(hue: hue, saturation: 0, brightness: 0, alpha: 0)
    }
}
