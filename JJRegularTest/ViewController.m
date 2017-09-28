//
//  ViewController.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/24.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "ViewController.h"

#import "LJJRegular.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([LJJRegular regexWithText:@"123" digitStyle:DigitStyleIsDigit arg1:@"2" arg2:nil]) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
    
    NSString *text = @"我1是一个好人2是一个好人是的就是一个好人好   好友  好朋友";
    NSLog(@"%@", [LJJRegular strCollectionsAndRangesOfText:text regex:@"好人"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
