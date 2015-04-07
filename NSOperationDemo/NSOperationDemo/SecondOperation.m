//
//  SecondOperation.m
//  NSOperationDemo
//
//  Created by jfl913 on 15/3/9.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "SecondOperation.h"

@interface SecondOperation ()

@property (assign, nonatomic, getter = isFinished) BOOL finished;

@end

@implementation SecondOperation

@synthesize finished = _finished;

- (void)start
{
    for (int i = 0 ; i < 100 ; i++) {
        if (self.isCancelled) {
            break;
        }
        NSLog(@"second: %f", sqrt(i));
    }
    self.finished = YES;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}


@end
