## Part 4 - Polishing Gravity View Controller
### 04-01 - Special UIView Subclass
- fix the auto layout issue. 4 constraints have a -16 value and they should be -20. Lesson in always remembering to run on device. I didn’t notice this issue until I ran it on a 6+
- **run**
- add spring damping effect to the animation of the lower floor surround view when its coming back on screen
- **run** - show how the spring works
- Create new file “CircleView.swift”
- subclass UIView
- Create convenience init(radius: CGFloat, origin: CGPoint, color: UIColor)
- Override collisionBoundsType in the subclass to return ellipse
- create a UIColor+RandomColor.swift file with the random color code
- change the code in the tap gesture recognizer ibaction to use the new CircleView
- **run** - now a bunch of randomly color circles should be appearing in the view. When the button is clicked, they should all fall through and shortly after, the button returns and then they all stack up again.

