//
//  FREDebugPuck.m
//  debugpuck
//
//  Created by Jordan Zucker on 2/14/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FREDebugPuck.h"

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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"beginTracking");
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"continueTracking");
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:0.1
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.6
                        options:(UIViewAnimationOptionAllowUserInteraction|
                                 UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         __strong typeof(wself) sself = wself;
                         if (!sself) {
                             return;
                         }
                         NSLog(@"currentPosition: %@", NSStringFromCGPoint([touch locationInView:sself.superview]));
                         NSLog(@"previousPosition: %@", NSStringFromCGPoint([touch previousLocationInView:sself.superview]));
                     }
                     completion:nil];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"endTracking");
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    NSLog(@"cancelTracking");
}

@end
