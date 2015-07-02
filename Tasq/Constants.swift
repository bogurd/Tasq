//
//  Constants.swift
//  Tasq
//
//  Created by George Katsikas on 6/21/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

//Not really constants, must mostly just them.
let debug = false

//Dimension Related
let borderFractioniPhone: Double = 1/40
let marginFractioniPhone: Double = 1/35
let borderScaleiPhone: CGFloat = 0.98

let borderFractioniPad: Double = 1/40
let marginFractioniPad: Double = 1/35
let borderScaleiPad: CGFloat = 0.98

var borderFraction: Double = 0
var marginFraction: Double = 0
var borderScale: CGFloat = 0

func initConstants(){
    if UIDevice.currentDevice().userInterfaceIdiom == .Phone{
        borderFraction = borderFractioniPhone
        marginFraction = marginFractioniPhone
        borderScale = borderScaleiPhone
    }else if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
        borderFraction = borderFractioniPad
        marginFraction = marginFractioniPad
        borderScale = borderScaleiPad
    }
    marginFraction *= Double(2/(Double(BoardNode.sharedNode.boardSize^(1/2))))
    //borderFraction *= Double(2.5/(Double(BoardNode.sharedNode.boardSize^(1/2))))
}
var gameController = GameViewController()
var screenSize = UIScreen.mainScreen().bounds.size
var screenCenter = CGPoint(x: screenSize.width/2, y: screenSize.height/2)
var bottomLine = CGPoint(x: screenCenter.x, y: BoardNode.sharedNode.boardArea.position.y/2)
var topLine = CGPoint(x: screenCenter.x, y: (screenSize.height+BoardNode.sharedNode.boardArea.position.y+BoardNode.sharedNode.boardArea.frame.height)/2)
//
//TODO
//
//make border/margin take boardSize into account
let border: Double = borderFraction*Double(screenSize.width)
let margin: Double = marginFraction*Double(screenSize.width)


//Colors
let bgColor = UIColor(red: 41.0/255.0, green: 61.0/255.0, blue: 84.0/255.0, alpha: 1.0)
let boardColor = UIColor(red: 29.0/255.0, green: 45.0/255.0, blue: 68.0/255.0, alpha: 1.0)
let lightColorOn = UIColor(red: 116.0/255.0, green: 140.0/255.0, blue: 171.0/255.0, alpha: 1.0)
let lightColorOff = UIColor(red: 13.0/255.0, green: 19.0/255.0, blue: 33.0/255.0, alpha: 1.0)
let lightColorWon = UIColor(red: 13.0/255.0, green: 190.0/255.0, blue: 33.0/255.0, alpha: 1.0)

//Game
var difficulty = gameDifficulty.normal



