//
//  GravityViewController.swift
//  Dynamics
//
//  Created by Jeffrey Bergier on 9/5/15.
//  Copyright © 2015 Saturday Apps. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    
    @IBOutlet weak var instructionalTextLabel: UILabel?
    @IBOutlet weak var dropFloorButtonSurroundView: UIView?
    
    lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    let gravityBehavior = UIGravityBehavior()
    let collisionBehavior = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animator.addBehavior(self.gravityBehavior)
        self.animator.addBehavior(self.collisionBehavior)
        
        self.setCollisionBehaviorCollisionBoundaryToView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.instructionalAnimationTimer?.invalidate()
        self.instructionalAnimationTimer = .None
        self.instructionalAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "instructionAnimationTimerDidFire:", userInfo: .None, repeats: true)
        self.instructionalAnimationTimer?.fire()
    }
    
    func setCollisionBehaviorCollisionBoundaryToView() {
        let collisionRect: CGRect
        if let dropFloorButtonSurroundView = self.dropFloorButtonSurroundView {
            collisionRect = CGRect(
                x: self.view.frame.origin.x,
                y: self.view.frame.origin.y,
                width: self.view.frame.size.width,
                height: self.view.frame.size.height - dropFloorButtonSurroundView.frame.size.height
            )
        } else {
            collisionRect = self.view.frame
        }
        self.collisionBehavior.addBoundaryWithIdentifier("GravityViewBounds", forPath: UIBezierPath(rect: collisionRect))
    }
    
    var instructionalAnimationTimer: NSTimer?
    func instructionAnimationTimerDidFire(timer: NSTimer?) {
        self.pulseInstructionalTextLabel()
    }
    
    func pulseInstructionalTextLabel() {
        UIView.animateWithDuration(0.9,
            delay: 0.0,
            options: .BeginFromCurrentState,
            animations: {
                self.instructionalTextLabel?.alpha = 0.2
            },
            completion: { success in
                UIView.animateWithDuration(0.9,
                    delay: 0.0,
                    options: .BeginFromCurrentState,
                    animations: {
                        self.instructionalTextLabel?.alpha = 1.0
                    },
                    completion: .None)
        })
    }

    func animateOutInstructionalTextLabel() {
        self.instructionalAnimationTimer?.invalidate()
        UIView.animateWithDuration(0.9,
            delay: 0.0,
            options: .BeginFromCurrentState,
            animations: {
                self.instructionalTextLabel?.alpha = 0.0
            },
            completion: { success in
                self.instructionalTextLabel?.hidden = true
        })
    }
    
    @IBAction func didTapOnScreen(sender: UITapGestureRecognizer?) {
        // happens only the first time the screen is touched
        if self.instructionalTextLabel?.hidden == false {
            self.animateOutInstructionalTextLabel()
        }
        
        // this happens every other time
        if let sender = sender {
            let touchPoint = sender.locationInView(.None)
            let newView = UIView(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width: 30, height: 30))
            newView.backgroundColor = .purpleColor()
            self.view.addSubview(newView)
            self.gravityBehavior.addItem(newView)
            self.collisionBehavior.addItem(newView)
        }
    }
    
    @IBAction func didTapDropFloorButton(sender: UIButton) {
        UIView.animateWithDuration(0.3,
            delay: 0.0,
            options: .BeginFromCurrentState,
            animations: {
                if let dropFloorButtonSurroundView = self.dropFloorButtonSurroundView {
                    dropFloorButtonSurroundView.transform = CGAffineTransformTranslate(dropFloorButtonSurroundView.transform, 0, dropFloorButtonSurroundView.frame.size.height)
                }
            },
            completion: { success in
                self.collisionBehavior.removeBoundaryWithIdentifier("GravityViewBounds")
                let delay = 2.0
                let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
                dispatch_after(dispatchTime, dispatch_get_main_queue()) {
                    UIView.animateWithDuration(0.3,
                        delay: 0.0,
                        options: .BeginFromCurrentState,
                        animations: {
                            if let dropFloorButtonSurroundView = self.dropFloorButtonSurroundView {
                                dropFloorButtonSurroundView.transform = CGAffineTransformIdentity
                            }
                        },
                        completion: { success in
                            self.setCollisionBehaviorCollisionBoundaryToView()
                    })
                }
                
        })
    }
}