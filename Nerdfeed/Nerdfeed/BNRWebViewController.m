//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by jfl913 on 15/2/11.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController ()

@end

@implementation BNRWebViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        [(UIWebView *)self.view loadRequest:[NSURLRequest requestWithURL:_URL]];
    }
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
