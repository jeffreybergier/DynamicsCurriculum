//
//  UIColor+RandomColor.swift
//  Dynamics
//
//  Created by Jeffrey Bergier on 9/5/15.
//  Copyright © 2015 Saturday Apps. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor {
        let random = Int(arc4random_uniform(12))
        switch random {
        case 0:
            return UIColor.blackColor()
        case 1:
            return UIColor.darkGrayColor()
        case 2:
            return UIColor.lightGrayColor()
        case 3:
            return UIColor.grayColor()
        case 4:
            return UIColor.redColor()
        case 5:
            return UIColor.greenColor()
        case 6:
            return UIColor.blueColor()
        case 7:
            return UIColor.cyanColor()
        case 8:
            return UIColor.yellowColor()
        case 9:
            return UIColor.magentaColor()
        case 10:
            return UIColor.orangeColor()
        case 11:
            return UIColor.purpleColor()
        default:
            return UIColor.brownColor()
        }
    }
}
