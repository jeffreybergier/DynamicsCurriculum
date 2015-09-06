## Part 3 - Cleaning up memory
### 03-01 - Cleaning up memory
- Explain that even though the views are not on screen, they are still in the “view hierarchy” and they are still being animated with the gravity and collision behavior… FOREVER.
- So, at the end of the drop the floor animation, we need go ask the collision behavior to tell us all of its items and we need to go through and remove them from the collision behavior, and from the gravity behavior and the main view.
- This will cause a bug where the user can keep tapping and then at the end of the drop the floor animation, all views they added since they started the animation, have them fix that by 
	- wiring up the tap gesture recognizer and 
	- disabling it during the animation
