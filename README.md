# Spring Animation

```
/* Performs `animations` using a timing curve described by the motion of a spring. When `dampingRatio` is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop. You can use the initial spring velocity to specify how fast the object at the end of the simulated spring was moving before it was attached. It's a unit coordinate system, where 1 is defined as travelling the total animation distance in a second. So if you're changing an object's position by 200pt in this animation, and you want the animation to behave as if the object was moving at 100pt/s before the animation started, you'd pass 0.5. You'll typically want to pass 0 for the velocity. */ 


+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

```

该Demo可以针对Spring Animation三个参数 `duration 执行时间` `dampingRatio阻尼系数` `velocity速率` 进行快速设置，从而达到 预览Spring Animation的具体执行效果。

## UP

```
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut;
    
    switch (self.segmentContro.selectedSegmentIndex) {
        case 0:
            options = UIViewAnimationOptionCurveEaseInOut;
            break;
        case 1:
            options = UIViewAnimationOptionCurveEaseIn;
            break;
        case 2:
            options = UIViewAnimationOptionCurveEaseOut;
            break;
        case 3:
            options = UIViewAnimationOptionCurveLinear;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:self.durationSlider.value delay:0.f usingSpringWithDamping:self.dampingSlider.value initialSpringVelocity:self.springVelocitySlider.value options:options animations:^{
        
        CGRect frame = self.targetView.frame;
        frame.origin.y = 0;
        self.targetView.frame = frame;
        
    } completion:nil];
    
```

## down

```
UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut;
    
    switch (self.segmentContro.selectedSegmentIndex) {
        case 0:
            options = UIViewAnimationOptionCurveEaseInOut;
            break;
        case 1:
            options = UIViewAnimationOptionCurveEaseIn;
            break;
        case 2:
            options = UIViewAnimationOptionCurveEaseOut;
            break;
        case 3:
            options = UIViewAnimationOptionCurveLinear;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:self.durationSlider.value delay:0.f usingSpringWithDamping:self.dampingSlider.value initialSpringVelocity:self.springVelocitySlider.value options:options animations:^{
        
        CGRect frame = self.targetView.frame;
        frame.origin.y = 300;
        self.targetView.frame = frame;
        
    } completion:nil];
    
```


![demo](https://raw.githubusercontent.com/778477/SpringAnimation/master/demo.gif)