//
//  ViewController.m
//  ReturnDEMO
//
//  Created by jfl913 on 15/3/24.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

typedef void(^TestBlock)(NSString *name);

@interface ViewController ()

@property (nonatomic, copy) TestBlock testBlock;

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
- (IBAction)tapButton:(id)sender {
    [self setTestBlock:^(NSString *name){
        return;
    }];
    NSLog(@"return");
}

@end
