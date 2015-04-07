//
//  MyLengthyOperation.m
//  NSOperationDemo
//
//  Created by jfl913 on 15/3/9.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "MyLengthyOperation.h"

@interface MyLengthyOperation ()

@property (assign, nonatomic, getter = isFinished) BOOL finished;
@property (assign, nonatomic, getter = isExecuting) BOOL executing;

@end

@implementation MyLengthyOperation

@synthesize finished = _finished;
@synthesize executing = _executing;

- (void)start
{
    for (int i = 0 ; i < 100 ; i++) {
        if (self.isCancelled) {
            break;
        }
        NSLog(@"first: %f", sqrt(i));
    }
    self.finished = YES;
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)cancel
{
    if (self.isFinished) {
        return;
    }
    
    [super cancel];
}

@end
