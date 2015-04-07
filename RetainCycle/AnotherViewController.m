//
//  AnotherViewController.m
//  RetainCycle
//
//  Created by jfl913 on 15/1/7.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "AnotherViewController.h"
#import "ThirdViewController.h"
#import <objc/runtime.h>

@interface AnotherViewController ()

@property (nonatomic, strong) NSTimer *timer;
//@property (nonatomic, strong) ThirdViewController *thirdViewController;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    button.frame = CGRectMake(150, 250, 50, 50);
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneItem;
    NSLog(@"before ARC Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(output) userInfo:nil repeats:YES];
    
    NSArray *navControllersArray = self.navigationController.viewControllers;
    UIViewController *presentingViewController = self.presentingViewController;
    UIViewController *presentedViewController = self.presentedViewController;
    
    NSLog(@"navControllers: %@", navControllersArray);
    NSLog(@"presentingViewController: %@", presentingViewController);
    NSLog(@"presentedViewController: %@", presentedViewController);
    
    self.title = @"Second";

}

- (void)output
{
    NSLog(@"output");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    NSLog(@"Under ARC Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMethod:(TestBlock)block
{
    self.ownblock = block;
}

- (void)holdChildViewController:(UIViewController *)childViewController
{
    objc_setAssociatedObject(self, _cmd, childViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)tapButton:(id)sender
{
    if (self.ownblock) {
        self.ownblock(@"xiaoli");
    }
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
//
    [self.navigationController pushViewController:thirdVC animated:NO];
//    UINavigationController *navController = self.navigationController;
//    [self holdChildViewController:thirdVC];
//    [thirdVC didMoveToParentViewController:self];
//    [self.navigationController.view addSubview:thirdVC.view];
    
}

- (void)done
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

//- (ThirdViewController *)thirdViewController
//{
//    if (!_thirdViewController) {
//        _thirdViewController = [[ThirdViewController alloc] init];
//        __weak ThirdViewController *weakThirdViewController = _thirdViewController;
//        _thirdViewController.thirdBlock = ^(NSString *name){
//            NSLog(@"self property name: %@, %@", name, _thirdViewController);
//        };
//    }
//    return _thirdViewController;
//}


- (void)dealloc
{
    NSLog(@"no leak: %s", __FUNCTION__);
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
