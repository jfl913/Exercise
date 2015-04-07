//
//  ViewController.m
//  CollectionViewInfiniteScrolling
//
//  Created by jfl913 on 15/1/27.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"
#import <SVPullToRefresh.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCellReuseIdentifier"];
    
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"InfiniteScrolling");
            [self.collectionView.infiniteScrollingView stopAnimating];
        });
        
        
    }];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",nil];
    NSArray* reversedArray = [[array reverseObjectEnumerator] allObjects];
    NSLog(@"reversedArray: %@", reversedArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCellReuseIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

#pragma mark - UICollectionViewDelegate


@end
