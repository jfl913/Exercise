//
//  RWTSearchResultsViewModel.m
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/26.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTSearchResultsViewModel.h"

@implementation RWTSearchResultsViewModel

- (instancetype)initWithSearchResults:(RWTFlickrSearchResults *)results services:(id<RWTViewModelServices>)services
{
    self = [super init];
    if (self) {
        _title = results.searchString;
        _searchResults = results.photos;
    }
    
    return self;
}

@end
