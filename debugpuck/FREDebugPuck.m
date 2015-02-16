//
//  FREDebugPuck.m
//  debugpuck
//
//  Created by Jordan Zucker on 2/14/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

@import MessageUI;

#import "FREDebugPuck.h"

@interface FREDebugPuck ()

@end

@implementation FREDebugPuck

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)commonInit
{
    UILabel *heyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    heyLabel.textAlignment = NSTextAlignmentCenter;
    heyLabel.numberOfLines = 2;
    heyLabel.textColor = [UIColor greenColor];
    heyLabel.text = @"hey\ngirl";
    [self addSubview:heyLabel];
    self.backgroundColor = [UIColor redColor];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
    [self addGestureRecognizer:panGestureRecognizer];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    [self addGestureRecognizer:tapGestureRecognizer];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"handle tap");
    MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] init];
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
//    NSLog(@"handle");
    CGPoint translate = [panGestureRecognizer translationInView:self.superview];
//    NSLog(@"translate: %@", NSStringFromCGPoint(translate));
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:(UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         __strong typeof (wself) sself = wself;
                         if (!sself) {
                             return;
                         }
                         sself.center = CGPointMake(sself.center.x + translate.x, sself.center.y + translate.y);
                         [panGestureRecognizer setTranslation:CGPointMake(0.0f, 0.0f) inView:sself.superview];
                     }
                     completion:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

//- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    NSLog(@"beginTracking");
//    
//    return YES;
//}
//
//- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    NSLog(@"continueTracking");
//    __weak typeof(self) wself = self;
//    [UIView animateWithDuration:0.1
//                          delay:0.0
//         usingSpringWithDamping:0.4
//          initialSpringVelocity:0.6
//                        options:(UIViewAnimationOptionAllowUserInteraction|
//                                 UIViewAnimationOptionBeginFromCurrentState)
//                     animations:^{
//                         __strong typeof(wself) sself = wself;
//                         if (!sself) {
//                             return;
//                         }
//                         CGPoint currentPoint = [touch locationInView:sself.superview];
//                         CGPoint previousPoint = [touch previousLocationInView:sself.superview];
//                         NSLog(@"currentPosition: %@", NSStringFromCGPoint(currentPoint));
//                         NSLog(@"previousPosition: %@", NSStringFromCGPoint(previousPoint));
//                         sself.transform = CGAffineTransformMakeTranslation((currentPoint.x-previousPoint.x), (currentPoint.y - previousPoint.y));
//                         
//                     }
//                     completion:nil];
//    return YES;
//}
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    NSLog(@"endTracking");
//}
//
//- (void)cancelTrackingWithEvent:(UIEvent *)event
//{
//    NSLog(@"cancelTracking");
//}

#pragma mark - Keyboard Handling

//- (void)handleKeyboardWillAppear:(NSNotification *)notification
//{
//    NSLog(@"keyboardappear: %@", notification.userInfo);
//}
//
//- (void)handleKeyboardWillHide:(NSNotification *)notification
//{
//    NSLog(@"keyboardWillHide: %@", notification.userInfo);
//}

- (void)handleKeyboardWillChangeFrame:(NSNotification *)notification
{
    NSLog(@"keyboardWillChangeFrame: %@", notification.userInfo);
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (CGRectContainsRect(keyboardEndFrame, self.frame)) {
        NSLog(@"move it!");
        self.center = CGPointApplyAffineTransform(self.center, CGAffineTransformMakeTranslation(0, -keyboardEndFrame.size.height));
    }
}

@end
