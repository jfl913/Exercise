//
//  RWBasicCell.h
//  DeviantArtBrowser
//
//  Created by jfl913 on 15/4/7.
//  Copyright (c) 2015年 Razeware, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWLabel.h"

@interface RWBasicCell : UITableViewCell

@property (nonatomic, weak) IBOutlet RWLabel *titleLabel;
@property (nonatomic, weak) IBOutlet RWLabel *subtitleLabel;

@end
