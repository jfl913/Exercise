//
//  ListViewController.h
//  ClassicPhotos
//
//  Created by jfl913 on 15/3/8.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

#define kDatasourceURLString @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"

@interface ListViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *photos;

@end
