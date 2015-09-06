## Part 3 - Polishing Gravity View Controller
### 03-01 - Special UIView Subclass
- Create new file “CircleView.swift”
- subclass UIView
- Create convenience init(radius: CGFloat, origin: CGPoint, color: UIColor)
- Override collisionBoundsType in the subclass to return ellipse
- create a UIColor+RandomColor.swift file with the random color code
- change the code in the tap gesture recognizer ibaction to use the new CircleView
- **run** - now a bunch of randomly color circles should be appearing in the view. When the button is clicked, they should all fall through and shortly after, the button returns and then they all stack up again.
