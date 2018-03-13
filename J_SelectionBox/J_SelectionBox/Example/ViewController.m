//
//  ViewController.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "ViewController.h"
#import "J_SelectionBox.h"

#define SCREEN_WIDTH         [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT         [UIScreen mainScreen].bounds.size.height

@interface ViewController () {
    J_SelectionBox *exampleBox1;
}

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    exampleBox1 = [[J_SelectionBox alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2 - 50, SCREEN_WIDTH, 100)];
    exampleBox1.backgroundColor = [UIColor yellowColor];
    exampleBox1.startedNum = 0;
    exampleBox1.hideLowerArrowWhenZero = false;
    exampleBox1.allowNegativeNumber = true;
    
    [self.view addSubview:exampleBox1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
