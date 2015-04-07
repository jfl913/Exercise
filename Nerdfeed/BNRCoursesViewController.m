//
//  BNRCoursesViewController.m
//  Nerdfeed
//
//  Created by jfl913 on 15/2/11.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"

@interface BNRCoursesViewController () <NSURLSessionDataDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BNRCoursesViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        [self fetchFeed];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)fetchFeed
{
    NSString *requestString = @"https://bookapi.bignerdranch.com/private/courses.json";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestString]];
    NSURLSessionDataTask *sessionDataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.courses = jsonObject[@"courses"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    [sessionDataTask resume];
}

- (void)fetchImage
{
    NSString *imageString = @"http://img.hb.aicdn.com/eb737894162082b8386a17a70091f07dc47571d6123522-mnWzMi_fw658";
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *imageSession = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                               delegate:self
                                                          delegateQueue:nil];
    NSURLSessionDownloadTask *imageDownloadTask = [imageSession
                                                   downloadTaskWithURL:[NSURL URLWithString:imageString]
                                                   completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    }];
    [imageDownloadTask resume];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.courses[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *url = [NSURL URLWithString:self.courses[indexPath.row][@"url"]];
    NSString *title = self.courses[indexPath.row][@"title"];
    self.webViewController.URL = url;
    self.webViewController.title = title;
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"BigNerdRanch"
                                                             password:@"AchieveNerdvana"
                                                          persistence:NSURLCredentialPersistenceForSession];
    completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
}

@end
