//
//  RWTFlickrSearch.h
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol RWTFlickrSearch <NSObject>

- (RACSignal *)flickrSearchSignal:(NSString *)searchString;

@end
