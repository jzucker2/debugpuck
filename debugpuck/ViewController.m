//
//  ViewController.m
//  debugpuck
//
//  Created by Jordan Zucker on 2/14/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "ViewController.h"
#import "FREDebugPuck.h"

@interface ViewController ()

@property (nonatomic, strong) FREDebugPuck *debugPuck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.debugPuck = [[FREDebugPuck alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.view addSubview:self.debugPuck];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
