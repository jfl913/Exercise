//
//  ViewController.m
//  The NSMutableSet class declares the programmatic interface to a mutable, unordered collection of distinct objects.  NSMutableSetDemo
//
//  Created by jfl913 on 15/3/26.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableSet *mutableSet = [[NSMutableSet alloc] init];
    [mutableSet addObject:@"jfl"];
    [mutableSet addObject:@"wl"];
    
    NSMutableSet *anotherSet = [[NSMutableSet alloc] init];
    [mutableSet addObject:@"jfl"];
    [mutableSet addObject:@"gn"];
    
    [mutableSet unionSet:anotherSet];
    
    NSLog(@"mutableSet: %@", mutableSet);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
