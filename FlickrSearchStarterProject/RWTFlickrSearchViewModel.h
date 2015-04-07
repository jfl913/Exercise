//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"

@interface RWTFlickrSearchViewModel : NSObject

@property (strong, nonatomic) NSString *searchText;
@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) RACCommand *executeSearch;

- (instancetype)initWithService:(id <RWTViewModelServices>)services;

@end
