//
//  LDDNavTransition.h
//  testCopods
//
//  Created by 李洞洞 on 18/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,LDDNavOneTrantationType){
    LDDNavOneTrantationTypePush,
    LDDNavOneTrantationTypePop
};
@interface LDDNavTransition : NSObject<UIViewControllerAnimatedTransitioning>
/**
 *  初始化动画过渡代理
 */
+ (instancetype)transitionWithType:(LDDNavOneTrantationType)type;
- (instancetype)initWithTransitionType:(LDDNavOneTrantationType)type;
@end
