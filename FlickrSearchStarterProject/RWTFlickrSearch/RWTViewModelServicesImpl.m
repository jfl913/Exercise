//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickrSearchImpl.h"
#import "RWTSearchResultsViewController.h"

@interface RWTViewModelServicesImpl ()

@property (nonatomic, strong) RWTFlickrSearchImpl *services;
@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation RWTViewModelServicesImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        _services = [RWTFlickrSearchImpl new];
        _navigationController = navigationController;
    }
    
    return self;
}

- (id <RWTFlickrSearch>)getFlickrSearchService
{
    return self.services;
}

- (void)pushViewModel:(id)viewModel
{
    id viewController;
    if ([viewModel isKindOfClass:[RWTSearchResultsViewModel class]]) {
        viewController = [[RWTSearchResultsViewController alloc] initWithViewModel:viewModel];
    }else{
        NSLog(@"an unknown viewModel was pushed.");
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
