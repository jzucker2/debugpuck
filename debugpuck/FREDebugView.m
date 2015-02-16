//
//  FREDebugView.m
//  debugpuck
//
//  Created by Jordan Zucker on 2/14/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FREDebugView.h"

@interface FREDebugView ()

@property (nonatomic, assign) BOOL startedMoving;
@property (nonatomic) CGRect originalFrame;
@property (nonatomic, assign) NSTimeInterval lastTouchesBeganTimestamp;


@end

@implementation FREDebugView

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
    _startedMoving = NO;
    if (!CGRectIsEmpty(_originalFrame)) {
        self.frame = _originalFrame;
    }
//    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
//    [self addGestureRecognizer:self.panGestureRecognizer];
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

//- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
//{
//    NSLog(@"handle");
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

#pragma mark - Selectors

- (void)handleTap
{
    
}

#pragma mark - UIView touches

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    _lastTouchesBeganTimestamp = touch.timestamp;
//    __block CGPoint location = [touch locationInView:self];
//    __block CGPoint previous = [touch previousLocationInView:self];
//    
//    
//    if (CGRectIsEmpty(_originalFrame)) {
//        _originalFrame = self.frame;
//    }
//    
//    if (!CGAffineTransformIsIdentity(self.transform)) {
//        location = CGPointApplyAffineTransform(location, self.transform);
//        previous = CGPointApplyAffineTransform(previous, self.transform);
//    }
//    
//    if (touch.tapCount == 1) {
//        NSLog(@"play pause!");
//        [self performSelector:@selector(handleTap) withObject:nil afterDelay:0.2];
//        //[self togglePlayPause];
//    }
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    __block CGPoint location = [touch locationInView:self];
//    __block CGPoint previous = [touch previousLocationInView:self];
//    
//    CGAffineTransform translateTransformTest = CGAffineTransformMakeTranslation(location.x-previous.x, location.y-previous.y);
//    
//    if (!_startedMoving) {
//        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.transform = CGAffineTransformMakeScale(0.6, 0.6);
//        } completion:^(BOOL finished) {
//            _startedMoving = YES;
//            [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                self.center = CGPointApplyAffineTransform(self.center, translateTransformTest);
//            } completion:^(BOOL finished) {
//                //NSLog(@"finished!");
//            }];
//        }];
//    } else {
//        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.center = CGPointApplyAffineTransform(self.center, translateTransformTest);
//        } completion:^(BOOL finished) {
//            //NSLog(@"finished!");
//        }];
//    }
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    _startedMoving = NO;
//    _lastTouchesBeganTimestamp = 0;
//    
//    __block BOOL didUpvote = NO;
//    __block BOOL didDownvote = NO;
//    __block CGRect finalFrame;
////    if (self.frame.origin.y < (-self.superview.frame.size.height * UPPER_VOTE_THRESHOLD_FACTOR)) {
////        NSLog(@"up");
////        finalFrame = CGRectOffset(self.frame, 0, -400);
////        didUpvote = YES;
////    } else if (self.frame.origin.y > (self.superview.frame.size.height * LOWER_VOTE_THRESHOLD_FACTOR)) {
////        NSLog(@"down");
////        didDownvote = YES;
////        finalFrame = CGRectOffset(self.frame, 0, 400);
////    } else {
////        finalFrame = _originalFrame;
////    }
////    
////    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
////        self.transform = CGAffineTransformIdentity;
////        self.frame = finalFrame;
////    } completion:^(BOOL finished) {
////        NSDictionary *userInfo = @{@"redditURL" : _redditURL};
////        if (didUpvote) {
////            [self pauseVideo];
////            [[NSNotificationCenter defaultCenter] postNotificationName:VideoPlayerViewPassedUpvoteThreshold object:self userInfo:userInfo];
////        } else if (didDownvote) {
////            [self pauseVideo];
////            [[NSNotificationCenter defaultCenter] postNotificationName:VideoPlayerViewPassedDownvoteThreshold object:self userInfo:userInfo];
////        }
////        didDownvote = NO;
////        didUpvote = NO;
////    }];
//}
//
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    _lastTouchesBeganTimestamp = 0;
//    _startedMoving = NO;
//    UITouch *touch = [touches anyObject];
//    __block CGPoint location = [touch locationInView:self];
//    __block CGPoint previous = [touch previousLocationInView:self];
//    
//    if (!CGAffineTransformIsIdentity(self.transform)) {
//        location = CGPointApplyAffineTransform(location, self.transform);
//        previous = CGPointApplyAffineTransform(previous, self.transform);
//    }
//    
//    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.transform = CGAffineTransformIdentity;
//        self.frame = _originalFrame;
//    } completion:^(BOOL finished) {
//        //NSLog(@"finished!");
//    }];
//}

@end
