//
//  ViewController.m
//  LDD自定义转场练习
//
//  Created by 李洞洞 on 20/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(64, 64, 64, 64)];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:@"push" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:btn];
}
- (void)push
{
    SecondController * sec = [[SecondController alloc]init];
    self.navigationController.delegate = sec;
    [self.navigationController pushViewController:sec animated:YES];
}
@end
