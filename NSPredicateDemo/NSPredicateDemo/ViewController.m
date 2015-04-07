//
//  ViewController.m
//  NSPredicateDemo
//
//  Created by jfl913 on 15/3/17.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "ViewController.h"

@interface Person : NSObject
@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *age;
@end

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *firstNames = @[ @"Alice", @"Bob", @"Charlie", @"Quentin" ];
    NSArray *lastNames = @[ @"Smith", @"Jones", @"Smith", @"Alberts" ];
    NSArray *ages = @[ @24, @27, @33, @31 ];
    
    NSMutableArray *people = [NSMutableArray array];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *person = [[Person alloc] init];
        person.firstName = firstNames[idx];
        person.lastName = lastNames[idx];
        person.age = ages[idx];
        [people addObject:person];
    }];
    
    NSPredicate *bobPredicate = [NSPredicate predicateWithFormat:@"firstName = 'Bob'"];
    NSPredicate *smithPredicate = [NSPredicate predicateWithFormat:@"lastName = %@", @"Smith"];
    NSPredicate *thirtiesPredicate = [NSPredicate predicateWithFormat:@"age >= 30"];
    NSPredicate *betweenPredicate = [NSPredicate predicateWithFormat:@"age between {26, 32}"];
    
    // ["Bob Jones"]
    NSLog(@"Bobs: %@", [people filteredArrayUsingPredicate:bobPredicate]);
    
    [people filterUsingPredicate:bobPredicate];
    NSLog(@"remove: %@", people);
    
    // ["Alice Smith", "Charlie Smith"]
    NSLog(@"Smiths: %@", [people filteredArrayUsingPredicate:smithPredicate]);
    
    // ["Charlie Smith", "Quentin Alberts"]
    NSLog(@"30's: %@", [people filteredArrayUsingPredicate:thirtiesPredicate]);
    // "Bob Jones", "Quentin Alberts"
    NSLog(@"27, 31: %@", [people filteredArrayUsingPredicate:betweenPredicate]);
}

- (void)testAssert:(NSString *)string
{
    NSParameterAssert(string);
    NSLog(@"string: %@", string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
