//
//  RWTSearchResultsViewModel.h
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/26.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"
#import "RWTFlickrSearchResults.h"

@interface RWTSearchResultsViewModel : NSObject

- (instancetype)initWithSearchResults:(RWTFlickrSearchResults *)results services:(id <RWTViewModelServices>)services;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *searchResults;

@end
