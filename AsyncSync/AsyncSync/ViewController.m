//
//  ViewController.m
//  AsyncSync
//
//  Created by jfl913 on 15/3/12.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        for (int i = 0; i < 28; i++) {
//            NSLog(@"i: %d", i);
//        }
//    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 28; i++) {
            NSLog(@"i: %d", i);
        }

    });
    
    for (int j = 0; j < 15; j++) {
        NSLog(@"j: %d", j);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
