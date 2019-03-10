//
//  LDDNavTransition.m
//  testCopods
//
//  Created by 李洞洞 on 18/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDDNavTransition.h"
@interface LDDNavTransition ()
@property(nonatomic,assign)LDDNavOneTrantationType type;
@end
@implementation LDDNavTransition
+ (instancetype)transitionWithType:(LDDNavOneTrantationType)type
{
    return [[self alloc]initWithTransitionType:type];
}
- (instancetype)initWithTransitionType:(LDDNavOneTrantationType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    switch (_type) {
        case LDDNavOneTrantationTypePush:
        {
            [self doPushAnimation:transitionContext];
        }
            break;
        case LDDNavOneTrantationTypePop:
        {
            [self doPopAnimation:transitionContext];
        }
            break;
        default:
            break;
    }
}

/**
 具体的push动画效果实现
 */
- (void)doPushAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //3.执行动画
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    toVC.view.frame = CGRectOffset(finalFrame, [UIScreen mainScreen].bounds.size.width, 0);
    
    UIView * containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.45 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame =finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

/**
 具体的pop动画效果实现
 */
- (void)doPopAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //3.执行动画
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    toVC.view.frame = CGRectOffset(finalFrame, -[UIScreen mainScreen].bounds.size.width, 0);
    
    UIView * containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.45 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame =finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}


@end
