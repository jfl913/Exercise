//
//  AnotherViewController.h
//  RetainCycle
//
//  Created by jfl913 on 15/1/7.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TestBlock)(NSString *name);

@interface AnotherViewController : UIViewController

@property (nonatomic, copy) TestBlock ownblock;

- (void)addMethod:(TestBlock)block;

@end
