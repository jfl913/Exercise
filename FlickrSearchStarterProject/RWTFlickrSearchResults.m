//
//  RWTFlickrSearchResults.m
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchResults.h"

@implementation RWTFlickrSearchResults

- (NSString *)description {
    return [NSString stringWithFormat:@"searchString=%@, totalresults=%lU, photos=%@",
            self.searchString, (unsigned long)self.totalResults, self.photos];
}

@end
