//
//  RWTViewModelServices.h
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTFlickrSearch.h"

@protocol RWTViewModelServices <NSObject>

- (id <RWTFlickrSearch>)getFlickrSearchService;
- (void)pushViewModel:(id)viewModel;

@end
