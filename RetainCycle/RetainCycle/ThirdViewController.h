//
//  ThirdViewController.h
//  RetainCycle
//
//  Created by jfl913 on 15/1/14.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ThirdBlock)(NSString *name);

@interface ThirdViewController : UIViewController

@property (nonatomic, copy) ThirdBlock thirdBlock;

@end
