//
//  ViewController.m
//  GCDDemo
//
//  Created by jfl913 on 15/3/18.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapButton:(id)sender
{
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"11111");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"22222");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"33333");
//    });
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"end");
//    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
//    dispatch_queue_t queue = dispatch_queue_create("com.jfl.io", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"AAAAAAA");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"BBBBBBBB");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"CCCCCCCCCC");
//    });
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"barrier");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"DDDDDDDDD");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"EEEEEEEEEE");
//    });
//
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"i: %d", i);
//    }
    
//    if ([NSThread isMainThread]) {
//        NSLog(@"@@@@@@@@@@@");
//    }else{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"##############");
//        });
//    }
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"jfl**********");
//    });
//    
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"i: %d", i);
//    }
    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            [array addObject:[NSNumber numberWithInt:i]];
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
//    
//    NSLog(@"array: %@", array);
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"jfl: %@", @"jfl");
//    });
//    
//    NSLog(@"wl: %@", @"wl");
    
}

@end
