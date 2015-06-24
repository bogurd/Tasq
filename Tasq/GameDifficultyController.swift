//
//  GameDifficultyController.swift
//  Tasq
//
//  Created by George Katsikas on 6/24/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import Foundation
import UIKit

class GameDifficultyController: UIViewController{

    @IBAction func createEasyGame(sender: AnyObject) {
        difficulty = .easy

    }
    @IBAction func createNormalGame(sender: AnyObject) {
        difficulty = .normal
    }
    @IBAction func createHardGame(sender: AnyObject) {
        difficulty = .hard
    }
    @IBAction func createExtremeGame(sender: AnyObject) {
        difficulty = .extreme
    }
}