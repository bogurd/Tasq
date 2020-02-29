//
//  Constants.swift
//  Tasq
//
//  Created by George Katsikas on 28/02/2020.
//  Copyright © 2020 George Katsikas. All rights reserved.
//

import UIKit
import SpriteKit

let rightPushTransition = SKTransition.push(with: .left, duration: 0.5)

var screenHeight = UIScreen.main.bounds.height
var screenWidth = UIScreen.main.bounds.width
var centerOfScreen = CGPoint.init(x: screenWidth/2, y: screenHeight/2)

var boardShapeSize = CGSize(width: screenWidth, height: screenWidth)

var borderPerc: CGFloat = 0.85

var lightOnColor = SKColor.init(named: "lightOnColor") ?? SKColor.white
var lightOffColor = SKColor.init(named: "lightOffColor") ?? SKColor.black

enum GameDifficulty: Int, CaseIterable {
//    static var allCases: [GameDifficulty] {
//        return [.easy, .normal, .hard, .extreme]
//    }
    case easy = 3
    case normal = 5
    case hard = 7
    case extreme = 9
    case ultra = 11
}

extension CaseIterable where Self: RawRepresentable {
    static var AllValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}
