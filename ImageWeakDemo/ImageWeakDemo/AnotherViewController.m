//
//  AnotherViewController.m
//  ImageWeakDemo
//
//  Created by jfl913 on 15/3/26.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "AnotherViewController.h"
#import "UIImageView+WebCache.h"

@interface AnotherViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlString = @"http://img.hb.aicdn.com/154fc0b70d9693759e9d66861b15e920f7d3d16648e10-9MxqJz_fw658";
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.imageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc
{
#ifdef DEBUG
    NSLog(@"release: %s", __FUNCTION__);
#endif
}


@end
