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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.instructionalAnimationTimer?.invalidate()
        self.instructionalAnimationTimer = .None
        self.instructionalAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "instructionAnimationTimerDidFire:", userInfo: .None, repeats: true)
        self.instructionalAnimationTimer?.fire()
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
    }
    
    @IBAction func didTapDropFloorButton(sender: UIButton) {
    }
}