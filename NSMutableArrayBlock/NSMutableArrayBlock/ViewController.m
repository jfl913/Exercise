//
//  ViewController.m
//  NSMutableArrayBlock
//
//  Created by jfl913 on 15/2/18.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *mutableArray = [NSMutableArray array];
    void (^testBlock)(NSString *string) = ^(NSString *itemString){
        [mutableArray addObject:itemString];
    };
    testBlock(@"jfl");
    NSLog(@"mutableArray: %@", mutableArray);
    
    NSMutableString *testString = [NSMutableString stringWithString:@"old"];
    void (^stringTestBlock)(void) = ^(){
        [testString setString:@"new"];
    };
    stringTestBlock();
    NSLog(@"testString: %@", testString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
