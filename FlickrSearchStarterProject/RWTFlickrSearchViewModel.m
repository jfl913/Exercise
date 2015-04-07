//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"
#import "RWTSearchResultsViewModel.h"

@interface RWTFlickrSearchViewModel ()

@property (nonatomic, weak) id<RWTViewModelServices> services;

@end


@implementation RWTFlickrSearchViewModel

- (instancetype)initWithService:(id<RWTViewModelServices>)services
{
    self = [super init];
    if (self) {
        _services = services;
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.title = @"Flickr search";
    
    RACSignal *validSearchSignal = [[RACObserve(self, searchText)
                                    map:^id(id value) {
                                        return @(self.searchText.length > 3);
                                    }]
                                    distinctUntilChanged];
    [validSearchSignal subscribeNext:^(NSNumber *x) {
        NSLog(@"search text is valid: %d", [x boolValue]);
    }];
    
    self.executeSearch = [[RACCommand alloc] initWithEnabled:validSearchSignal
                                                 signalBlock:^RACSignal *(id input) {
                                                     return [self executeSearchSignal];
                                                 }];
}

- (RACSignal *)executeSearchSignal
{
    return [[[self.services getFlickrSearchService]
             flickrSearchSignal:self.searchText]
            doNext:^(id results) {
                RWTSearchResultsViewModel *resultsViewModel = [[RWTSearchResultsViewModel alloc] initWithSearchResults:results services:self.services];
                [self.services pushViewModel:resultsViewModel];
            }];
}

@end
