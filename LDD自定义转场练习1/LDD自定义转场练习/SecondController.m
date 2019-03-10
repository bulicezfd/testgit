//
//  SecondController.m
//  testCopods
//
//  Created by 李洞洞 on 18/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "SecondController.h"
#import "LDDNavTransition.h"
@interface SecondController ()

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
}

/**遵守UINavgatationViewControllerDelegate实现代理方法*/
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation
   fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [LDDNavTransition transitionWithType:(operation == UINavigationControllerOperationPush ? LDDNavOneTrantationTypePush:LDDNavOneTrantationTypePop)];
}


@end


















