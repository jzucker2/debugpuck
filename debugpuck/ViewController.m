//
//  ViewController.m
//  debugpuck
//
//  Created by Jordan Zucker on 2/14/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "ViewController.h"
#import "FREDebugPuck.h"
#import "FREDebugView.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) FREDebugPuck *debugPuck;
@property (nonatomic, strong) FREDebugView *debugView;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation ViewController
{
    UIView *_weightView;
    UIPanGestureRecognizer *_recog;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.debugPuck = [[FREDebugPuck alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.view addSubview:self.debugPuck];
    
//    self.debugView = [[FREDebugView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    [self.view addSubview:self.debugView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    _weightView = [[UIView alloc] initWithFrame:CGRectMake(100.0f, 200.0f, 50.0f, 50.0f)];
//    _weightView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_weightView];
//    
//    _recog = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_panRecogFired:)];
//    _recog.minimumNumberOfTouches = 1;
//    [_weightView addGestureRecognizer:_recog];
//}
//
//- (void)_panRecogFired:(id)sender
//{
//    UIPanGestureRecognizer *panRecog = (UIPanGestureRecognizer *)sender;
//    CGPoint vel = [panRecog velocityInView:self.view];
//    NSLog(@"vel: %@", NSStringFromCGPoint(vel));
//    
//    NSLog(@"state: %ld", panRecog.state);
//    
//    UIView *recogView = [panRecog view];
//    
//    CGPoint translation = [panRecog translationInView:recogView];
//    CGFloat curY = recogView.frame.origin.y;
//    
//    if (panRecog.state == UIGestureRecognizerStateChanged) {
//        
//        // drag view vertially
//        CGRect frame = recogView.frame;
//        frame.origin.y = curY + translation.y;
//        recogView.frame = frame;
//        [panRecog setTranslation:CGPointMake(0.0f, 0.0f) inView:recogView];
//        
//    } else if (panRecog.state == UIGestureRecognizerStateEnded) {
//        
//        // touch up, animate to top of self.view w/ spring
//        NSLog(@"final vel: %@", NSStringFromCGPoint(vel));
//        
//        CGFloat finalX = recogView.frame.origin.x;
//        CGFloat finalY = 50.0f;
//        CGFloat curY = recogView.frame.origin.y;
//        
//        CGFloat distance = curY - finalY;
//        
//        CGFloat animationDuration = 2.0f;
//        
//        // normalize velocity as per docs
//        // multiply by -1 in this case b/c final desitination y is less
//        // than current y and recog's y velocity is negative when draggin up
//        // (therefore also works when released when dragging down)
//        CGFloat springVelocity = -1.0f * vel.y / distance;
//        
//        CGFloat springDampening = 0.5f;
//        
//        NSLog(@"dist: %f - spring vel: %f", distance, springVelocity);
//        
//        // for clean velocity transfer, use UIViewAnimationOptionCurveLinear
//        [UIView animateWithDuration:animationDuration delay:0.0 usingSpringWithDamping:springDampening initialSpringVelocity:springVelocity options:UIViewAnimationOptionCurveLinear animations:^{
//            
//            CGRect frame = recogView.frame;
//            frame.origin.x = finalX;
//            frame.origin.y = finalY;
//            recogView.frame = frame;
//            
//        } completion:^(BOOL finished) {
//            NSLog(@"done animating");
//        }];
//        
//        
//    }
//}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
