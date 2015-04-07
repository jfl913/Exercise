//
//  ViewController.m
//  NSProgressDemo
//
//  Created by jfl913 on 15/4/1.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <float.h>
#import <math.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
// 跟踪下载多个文件的总的进度要写成实例变量，如果写成局部变量是跟踪不到进度的
@property (nonatomic, strong) NSProgress *overallProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.overallProgress removeObserver:self forKeyPath:@"fractionCompleted"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapButton:(id)sender
{
    self.progressView.hidden = NO;
    
    NSString *string0 = @"http://yinyueshiting.baidu.com/data2/music/36865035/17765263198000128.mp3?xcode=284eea24b69901144f08538613ab1b5dd7ed2c9c576c829e";
    NSString *newString0 = [string0 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL0 = [NSURL URLWithString:newString0];
    NSURLRequest *request0 = [NSURLRequest requestWithURL:URL0];

    NSString *string1 = @"http://yinyueshiting.baidu.com/data2/music/120377011/33931272172800128.mp3?xcode=f70b80871233834e3b9559f3640d0b4db1359353234a7773";
    NSString *newString1 = [string1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL1 = [NSURL URLWithString:newString1];
    NSURLRequest *request1 = [NSURLRequest requestWithURL:URL1];
    
    NSString *string2 = @"http://yinyueshiting.baidu.com/data2/music/238979313/233598108000128.mp3?xcode=f70b80871233834e29c7902035440d7ce3f3d1a11e08e21b";
    NSString *newString2 = [string2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL2 = [NSURL URLWithString:newString2];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:URL2];
    
    NSString *string3 = @"http://yinyueshiting.baidu.com/data2/music/238979467/124380645248400128.mp3?xcode=55c307588fba59a536a9e9cb8a59d035a957e289de92d109";
    NSString *newString3 = [string3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL3 = [NSURL URLWithString:newString3];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:URL3];
    
    NSArray *array = @[request0, request1, request2, request3];
    
    self.overallProgress = [NSProgress progressWithTotalUnitCount:array.count];
    [self.overallProgress addObserver:self
                           forKeyPath:@"fractionCompleted"
                              options:NSKeyValueObservingOptionNew
                              context:nil];
    
    for (NSURLRequest *request in array) {
        [self.overallProgress becomeCurrentWithPendingUnitCount:1];
        [self downloadTaskWithRequest:request];
        [self.overallProgress resignCurrent];
    }
}

- (void)downloadTaskWithRequest:(NSURLRequest *)request
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSProgress *progress;
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"fractionCompleted"]) {
        NSProgress *progress = (NSProgress *)object;
        dispatch_async(dispatch_get_main_queue(), ^{
            // 这里如果有这行代码有时会崩溃，不知道什么原因。是不是之前的progress已经被释放了？再调用导致的？
//            NSLog(@"progress: %@", progress);
            self.progressView.progress = progress.fractionCompleted;
//            NSLog(@"localizedDescription: %@", progress.localizedDescription);
//            NSLog(@"localizedAdditionalDescription: %@", progress.localizedAdditionalDescription);
            // 用来判断progress.fractionCompleted = 1.0，不过不能直接这样写，这样写它们并不相等
            if (fabs(progress.fractionCompleted - 1) < FLT_EPSILON) {
//                [SVProgressHUD dismiss];
                self.progressView.hidden = YES;
                self.progressView.progress = 0;
                @try {
                    [progress removeObserver:self forKeyPath:@"fractionCompleted"];
                }
                @catch (NSException *exception) {
                    NSLog(@"exception: %@", exception);
                }
                @finally {
                    NSLog(@"finally");
                }
            }
        });
    }
}

@end
