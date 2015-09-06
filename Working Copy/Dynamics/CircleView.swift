//
//  CircleView.swift
//  Dynamics
//
//  Created by Jeffrey Bergier on 9/5/15.
//  Copyright © 2015 Saturday Apps. All rights reserved.
//

import UIKit

class CircleView: UIView {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .Ellipse
    }
    
    convenience init(radius: CGFloat, origin: CGPoint, color: UIColor) {
        self.init(frame: CGRect(x: origin.x, y: origin.y, width: radius * 2, height: radius * 2))
        self.backgroundColor = color
        self.layer.cornerRadius = radius
    }
}
