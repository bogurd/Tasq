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

//Dimension Related
let borderFraction: Double = 1/15
let marginFraction: Double = 1/20
let borderScale: CGFloat = 0.98

var screenSize = UIScreen.mainScreen().bounds.size
var screenCenter = CGPoint(x: screenSize.width/2, y: screenSize.height/2)

//
//TODO
//
//make border/margin take boardSize into account
let border: Double = borderFraction*Double(screenSize.width)
let margin: Double = marginFraction*Double(screenSize.width)


//Colors
let bgColor = UIColor(red: 41.0/255.0, green: 61.0/255.0, blue: 84.0/255.0, alpha: 1.0)
let boardColor = UIColor(red: 29.0/255.0, green: 45.0/255.0, blue: 68.0/255.0, alpha: 1.0)

var sharedNode = BoardNode()
