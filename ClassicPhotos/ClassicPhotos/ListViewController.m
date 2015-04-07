//
//  ListViewController.m
//  ClassicPhotos
//
//  Created by jfl913 on 15/3/8.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ListViewController.h"

static NSString *const cellReuseIdentifier = @"ListViewCellIdentifier";

@interface ListViewController ()

@property (nonatomic, strong) NSArray *imageURLStringsArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURL *dataSourceURL = [NSURL URLWithString:kDatasourceURLString];
//    NSDictionary *test = [[NSDictionary alloc] initWithContentsOfURL:dataSourceURL];
//    NSLog(@"test: %@", test);
    
    self.imageURLStringsArray = @[@"http://g.hiphotos.baidu.com/image/pic/item/d50735fae6cd7b8900d74cd40c2442a7d9330e29.jpg",
//                                  @"http://hb-topic-img.b0.upaiyun.com/9508a9e2969be4b06759efdc75752184bce280085834-LtD5Sv_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/d2f32408f7b55025c44f5bd01d8d3a50557cec8af39f-FCPens_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/724dbd755d96965c1d77f3801a060022d5280a5c100a7-D9V5CQ_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/a36a9275d0f5fed864ca45d9884129077a2aa7f88578-npVLj8_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/a1db03f59be98a2b7ddfc04e78ebe2d5b7fc7069e101-FSU9fT_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/29dbb6f99592a9227e786c30092028380027012e118ce-vUCpKT_sq140",
//                                  @"http://hb-topic-img.b0.upaiyun.com/c4bfed955f643bf317d541923e51d5844b942866636a-J1hz1I_sq140",
                                  ];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURLStringsArray.firstObject]];
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"image: %@", image);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)applySepiaFilterToImage:(UIImage *)image {
    
    CIImage *inputImage = [CIImage imageWithData:UIImagePNGRepresentation(image)];
    UIImage *sepiaImage = nil;
    CIContext *context = [CIContext contextWithOptions:nil];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues: kCIInputImageKey, inputImage, @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    CIImage *outputImage = [filter outputImage];
    CGImageRef outputImageRef = [context createCGImage:outputImage fromRect:[outputImage extent]];
    sepiaImage = [UIImage imageWithCGImage:outputImageRef];
    CGImageRelease(outputImageRef);
    return sepiaImage;
}


#pragma mark - Accessors

- (NSDictionary *)photos {
    
    if (!_photos) {
        NSURL *dataSourceURL = [NSURL URLWithString:kDatasourceURLString];
        _photos = [[NSDictionary alloc] initWithContentsOfURL:dataSourceURL];
    }
    return _photos;
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageURLStringsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    NSURL *imageURL = [NSURL URLWithString:self.imageURLStringsArray[indexPath.row]];
    NSError *error;
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL options:NSDataReadingMappedIfSafe error:&error];
    NSLog(@"error: %@", error);
    UIImage *image = nil;
    
    // 9
    if (imageData) {
        UIImage *unfiltered_image = [UIImage imageWithData:imageData];
        image = [self applySepiaFilterToImage:unfiltered_image];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.imageView.image = image;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
