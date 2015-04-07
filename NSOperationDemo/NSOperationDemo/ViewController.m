//
//  ViewController.m
//  NSOperationDemo
//
//  Created by jfl913 on 15/3/9.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import "MyLengthyOperation.h"
#import "SecondOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.name = @"DependencyQueue";
//    queue.maxConcurrentOperationCount = 1;
    
    
    MyLengthyOperation *operation = [[MyLengthyOperation alloc] init];
    operation.queuePriority = NSOperationQueuePriorityVeryHigh;
    SecondOperation *secondOperation = [[SecondOperation alloc] init];
    secondOperation.queuePriority = NSOperationQueuePriorityVeryLow;
    
//    [secondOperation addDependency:operation];
    [queue addOperation:secondOperation];
    [queue addOperation:operation];
    
    for (int i = 0; i < 8; i++) {
        NSLog(@"i: %d", i);
    }
    
    [operation cancel];
    
    [operation setCompletionBlock:^{
        NSLog(@"*****************");
    }];
    
    [secondOperation setCompletionBlock:^{
        NSLog(@"$$$$$$$$$$$$$$$$$");
    }];
    
    
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"i: %d", i);
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
