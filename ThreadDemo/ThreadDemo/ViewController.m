//
//  ViewController.m
//  ThreadDemo
//
//  Created by jfl913 on 15/4/2.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    __block int count = 10;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int count = 10;
        Test *test = [Test new];
        NSLog(@"xxxx: %@, %@", test, test.testString);
//        test.testString = @"jfl";
        while (count >= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                for (int j = 1; j < 10; j++) {
//                    NSLog(@"j: %d", j);
//                }
                NSLog(@"test: %@, %@", test, test.testString);
            });
            
            count--;
            test.testString = @"wl";
        }
        
        
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
