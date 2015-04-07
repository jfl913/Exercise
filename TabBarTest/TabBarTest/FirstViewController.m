//
//  FirstViewController.m
//  TabBarTest
//
//  Created by jfl913 on 15/1/9.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
#ifdef DEBUG
    NSLog(@"dealloc: %s", __FUNCTION__);
#endif
}

@end
