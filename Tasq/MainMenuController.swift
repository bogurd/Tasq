//
//  MainMenuController.swift
//  Tasq
//
//  Created by George Katsikas on 6/24/15.
//  Copyright (c) 2015 George Katsikas. All rights reserved.
//

import Foundation
import UIKit

class MainMenuController: UIViewController{
    
    override func viewDidLoad() {
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue | UIInterfaceOrientationMask.PortraitUpsideDown.rawValue)
    }
}