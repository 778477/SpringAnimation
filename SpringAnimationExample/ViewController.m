//
//  ViewController.m
//  SpringAnimationExample
//
//  Created by 郭妙友 on 16/6/15.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;
@property (weak, nonatomic) IBOutlet UISlider *dampingSlider;
@property (weak, nonatomic) IBOutlet UISlider *springVelocitySlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentContro;
@property (weak, nonatomic) IBOutlet UIView *targetView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
- (IBAction)dropDown:(id)sender {

    [self overUpScreen];
    
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
}

- (IBAction)silderChangeValue:(UISlider *)sender {
    
    NSInteger tag = sender.tag;
    
    UITextField *textField = [self.view viewWithTag:10+tag];
    
    textField.text = [NSString stringWithFormat:@"%.1lf",sender.value];
    
}

- (IBAction)dropUp:(id)sender {
    
    [self overDownScreen];
    
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
}


- (void)overDownScreen{
    CGRect frame = self.targetView.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height;
    self.targetView.frame = frame;
}

- (void)overUpScreen{
    CGRect frame = self.targetView.frame;
    frame.origin.y = -100;
    self.targetView.frame = frame;
}
@end
