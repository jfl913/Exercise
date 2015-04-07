//
//  TodayViewController.m
//  UsedSpace
//
//  Created by jfl913 on 14/11/21.
//  Copyright (c) 2014年 jfl913. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define RATE_KEY @"kUDRatedUsed"
#define kWClosedHeight   37.0
#define kWExpandedHeight 106.0

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *barView;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (nonatomic) unsigned long long fileSystemSize;
@property (nonatomic) unsigned long long freeSize;
@property (nonatomic) unsigned long long usedSize;

@property (nonatomic) double usedRate;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateInterface];
    
    [self setPreferredContentSize:CGSizeMake(0.0, kWClosedHeight)];
    [self.detailsLabel setAlpha:0.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateDetailsLabel
{
    NSByteCountFormatter *formatter =
    [[NSByteCountFormatter alloc] init];
    [formatter setCountStyle:NSByteCountFormatterCountStyleFile];
    
    self.detailsLabel.text =
    [NSString stringWithFormat:
     @"Used:\t%@\nFree:\t%@\nTotal:\t%@",
     [formatter stringFromByteCount:self.usedSize],
     [formatter stringFromByteCount:self.freeSize],
     [formatter stringFromByteCount:self.fileSystemSize]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateDetailsLabel];
    [self setPreferredContentSize:
     CGSizeMake(0.0, kWExpandedHeight)];
}

-(void)viewWillTransitionToSize:(CGSize)size
      withTransitionCoordinator:
(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:
     ^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         [self.detailsLabel setAlpha:1.0];
     } completion:nil];
}

- (void)updateInterface
{
    self.percentLabel.text = [NSString stringWithFormat:@"%.1f%%", self.usedRate * 100];
    self.barView.progress = self.usedRate;
}

- (void)updateSizes
{
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    self.fileSystemSize = [[dict valueForKey:NSFileSystemSize] unsignedLongLongValue];
    self.freeSize = [[dict valueForKey:NSFileSystemFreeSize] unsignedLongLongValue];
    self.usedSize = self.fileSystemSize - self.freeSize;
//    self.usedRate = self.usedSize / self.fileSystemSize;
}

- (double)usedRate
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey:RATE_KEY] doubleValue];
}

- (void)setUsedRate:(double)usedRate
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:[NSNumber numberWithDouble:usedRate] forKey:RATE_KEY];
    [userDefaults synchronize];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    NSLog(@"widgetPerformUpdateWithCompletionHandler");
    [self updateSizes];
    double newRate = (double)self.usedSize / (double)self.fileSystemSize;
    if (fabs(newRate - self.usedRate) < 0.0001) {
        completionHandler(NCUpdateResultNoData);
    }else{
        self.usedRate = newRate;
        [self updateInterface];
        completionHandler(NCUpdateResultNewData);
    }
    
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

//    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    
    defaultMarginInsets.bottom = 0;
    return UIEdgeInsetsZero;
}

@end
