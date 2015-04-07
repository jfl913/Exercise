//
//  ViewController.m
//  RetainCycle
//
//  Created by jfl913 on 15/1/7.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"

@interface ViewController ()

@property (nonatomic, strong) AnotherViewController *anotherViewController;

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
    AnotherViewController *anotherViewController = [[AnotherViewController alloc] init];
    __weak AnotherViewController *weakAnotherViewController = anotherViewController;
    [anotherViewController addMethod:^(NSString *name) {
        NSLog(@"name: %@", name);
    }];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:anotherViewController];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    UIViewController *presentingViewController = self.presentingViewController;
    UIViewController *presentedViewController = self.presentedViewController;
    
    NSLog(@"presentingViewController: %@", presentingViewController);
    NSLog(@"presentedViewController: %@", presentedViewController);
}

//- (AnotherViewController *)anotherViewController
//{
//    if (!_anotherViewController) {
//        _anotherViewController = [[AnotherViewController alloc] init];
//        __weak AnotherViewController *weakAnotherViewController = _anotherViewController;
//        [_anotherViewController addMethod:^(NSString *name) {
//            NSLog(@"self property name: %@", self);
//        }];
//    }
//    return _anotherViewController;
//}


@end
