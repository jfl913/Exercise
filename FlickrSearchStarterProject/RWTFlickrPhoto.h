//
//  RWTFlickrPhoto.h
//  RWTFlickrSearch
//
//  Created by jfl913 on 14/8/25.
//  Copyright (c) 2014年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTFlickrPhoto : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *identifier;

@end
