//
//  ThirdViewController.m
//  RetainCycle
//
//  Created by jfl913 on 15/1/14.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

- (void)test;

@end

@implementation ThirdViewController

+ (void)load
{
    NSLog(@"third load: %@", self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneItem;
    
    [self test];
    
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"333333" forState:UIControlStateNormal];
    button.frame = CGRectMake(150, 50, 50, 50);
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    NSArray *navControllersArray = self.navigationController.viewControllers;
//    UIViewController *presentingViewController = self.presentingViewController;
//    UIViewController *presentedViewController = self.presentedViewController;
//    
//    NSLog(@"navControllers: %@", navControllersArray);
//    NSLog(@"presentingViewController: %@", presentingViewController);
//    NSLog(@"presentedViewController: %@", presentedViewController);
    
    self.title = @"Third";
//    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)done
{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapButton:(id)sender
{
        if (self.thirdBlock) {
            self.thirdBlock(@"third");
        }
}

- (void)dealloc
{
    NSLog(@"no leak: %s", __FUNCTION__);
}

- (void)test
{
    __weak typeof (self)weakSelf = self;
    NSLog(@"%@", weakSelf);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
