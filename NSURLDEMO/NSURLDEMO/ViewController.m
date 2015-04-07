//
//  ViewController.m
//  NSURLDEMO
//
//  Created by jfl913 on 15/2/19.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@end

@implementation ViewController
{
    CGFloat timeCount;
    CGFloat playTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)clickButton:(id)sender
{
    [self downloadImage];

    NSMutableArray* arr = [NSMutableArray arrayWithObjects:
                           [NSNumber numberWithInt:0],
                           [NSNumber numberWithInt:3],
                           [NSNumber numberWithInt:2],
                           [NSNumber numberWithInt:1],
                           [NSNumber numberWithInt:7],
                           [NSNumber numberWithInt:8],
                           [NSNumber numberWithInt:9],
                           [NSNumber numberWithInt:10],
                           [NSNumber numberWithInt:6],
                           [NSNumber numberWithInt:5],
                           [NSNumber numberWithInt:4],
                           nil];
    
    [arr sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj2 compare:obj1];
        if (obj1 > obj2) {
            return NSOrderedAscending;
        }else if (obj1 < obj2){
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
        
    }];
    
//    NSArray *sortedArray = [arr sortedArrayUsingComparator: ^(id obj1, id obj2) {
//        return [obj1 compare:obj2];
//        if ([obj1 integerValue] > [obj2 integerValue]) {
//            return (NSComparisonResult)NSOrderedDescending;
//        }
//        
//        if ([obj1 integerValue] < [obj2 integerValue]) {
//            return (NSComparisonResult)NSOrderedAscending;
//        }
//        return (NSComparisonResult)NSOrderedSame;
//    }];
    
    NSLog(@"arr: %@", arr);
    
}

- (void)downloadImage
{
    self.progress.hidden = NO;
    NSString *imageString = [@"http://yinyueshiting.baidu.com/data2/music/15565636/15564597248400128.mp3?xcode=ec3bd97501dca9dd4cd0325ebdbd2c4f60cbc5c0cc102444" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionConfiguration *downloadImageSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *downloadImageSession = [NSURLSession
                                          sessionWithConfiguration:downloadImageSessionConfiguration
                                          delegate:self
                                          delegateQueue:nil];
//    NSURLSessionDownloadTask *downloadImageSessionTask = [downloadImageSession downloadTaskWithURL:[NSURL URLWithString:imageString] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageView.image = image;
//        });
//    }];
    NSURLSessionDownloadTask *downloadImageSessionTask = [downloadImageSession downloadTaskWithURL:[NSURL URLWithString:imageString]];
    [downloadImageSessionTask resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    dispatch_async(dispatch_get_main_queue(), ^{
//        self.progress.progress = (totalBytesWritten * 1.0) / totalBytesExpectedToWrite;
        [self.progress setProgress:((totalBytesWritten * 1.0) / totalBytesExpectedToWrite) animated:NO];
    });
    NSString *destinationPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"1.mp3"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:destinationPath]) {
        [fileManager removeItemAtPath:destinationPath error:nil];
    }

}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    self.progress.hidden = YES;
    self.progress.progress = 0;
    NSString *destinationPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"1.mp3"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:destinationPath]) {
        [fileManager removeItemAtPath:destinationPath error:nil];
    }
    [fileManager moveItemAtPath:[location path] toPath:destinationPath error:nil];
}
@end
