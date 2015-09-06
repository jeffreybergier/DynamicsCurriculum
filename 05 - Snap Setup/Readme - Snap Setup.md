## Part 5 - Snap View Controller
### 05-01 - Setup
- add PanGestureRecognizer to the purple surround view
- create an IBOutlet for the surround view
- create an IBAction for the pan gesture recognizer
- create the Switch statement in the IBAction that has a print for Began, Changed and Ended
- **run** - let the students explore touching the screen and seeing the print logs
__troubleshooting__ - if the view is not following the users finder, the Button in the view may need to be set (in interface builder) to ignore user interaction
### 05-02 - Dynamic Animator
- create property for Dynamic animator and a property for UISnapBehavior. The view for the snap is the purple surround view IBOutlet and the center is self.view.center.
- in the .Changed part of the switch statement set the snapPoint of the SnapBehavior to the be sender.locationInView(self.view)
- **run** - now the purple view should be following the students finger in a fluid like way
- __troubleshooting__ - if the view is not following the users finder, the Button in the view may need to be set (in interface builder) to ignore user interaction
### Take a break
### 05-03 - Change Snap Point with TapGestureRecognizer
- in interface builder, add a tap gesture recognizer to the main view of the view controller
- create an IBAction for the tap gesture recognizer
- in the IBAction, set self.snapBehavior.snapPoint to sender.locationInView(self.view)
- **run** - now when the student taps anywhere on the screen, the purple view should fly there.
### 05-04 - Make the Snap View Fly Back to Where the Drag Started
- In the view controller code, create a property called lastSnapPoint that is equal to CGPointZero.
- In the IBAction for the tap gesture recognizer, set this property to sender.locationInView
- Lastly, in the .Ended case for the switch statement, set the snapPoint of the snapBehavior to self.lastSnapPoint
- **run** - now the student can tap to “set” a new snap point. Then when they drag the view away from that point, it will fly back to that point.
### 05-05 - Optional Extras
- in interface builder create a small black view and wire it up with an IBOutlet
- in the didSet of the lastSnapPoint property, set the center of the small black view to be the snapPoint
- **run** - This will create a black marker where the purple view will always return.

- play with the damping factor of the snap behavior for more fun
- **run**


