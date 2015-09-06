## Part 2 - UIKit Dynamics in Gravity View Controller
### 02-01 - Gravity Behavior
- create UIDynamicAnimator property
- create UIGravityBehavior property
- in viewDidLoad add the gravity behavior to the animator
- in the tap gesture ibaction create a new view, give it a frame of a relatively small size
- give the view a background color
- add the new view to the main view and to the gravity behavior
- **Run** - Things should be falling from the same point on every tap
	- Show the students how RAM and CPU usage keep going up with every tap. Even though the views are off screen, the system keeps animating them.
- change the frame of the newView so it uses the CGPoint of the tap gesture recognizer
- **run** - Now the views should be falling from the finger
### Take a break
## 02-02 - Collision Behavior
- Create a Collision Behavior property
- in viewDidLoad, add the collision behavior to the dynamic animator
- in viewDidLoad, add a boundary to the Collision Behavior. The boundary should be a UIBezierPath that is created from the bounds of the main view.
- in the tap gesture recognizer method, when adding the newView to the gravity behavior, also add it to the collision behavior
- **run** - now the views should be stopping at the bottom of the screen
### Take a break
## 02-03 - Adjust the collision path
- in viewDidLoad use an if let statement to change the collision rect based on the height of the surroundView
- **run** - the views should all stack on top of the blue button
- In the IBAction for tapping on the lower the floor button, animate the surrounding view away and then remove the boundary from the collision behavior
- **run** - now the students should be able to stack a bunch of views and then click the button to clear them
- Now add a dispatch_after closure to perform another animation that brings the surround view back up and then adds the collision boundary again.
- **run** - now the student should be able to stack a bunch of views, tap on the lower the floor button, then keep tapping on the screen. Once the lower the floor view comes back on screen, the views should start staying on screen again.





		