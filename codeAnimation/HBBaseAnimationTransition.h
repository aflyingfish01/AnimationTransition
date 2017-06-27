//
//  HBBaseAnimationTransiton.h
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,AnimationTransitionType) {
    AnimationTransitionType_Present,
    AnimationTransitionType_Dismiss,
    AnimationTransitionType_Push,
    AnimationTransitionType_Pop,
};

/**
 *  transition动画基类   子类以HBModal*命名的是模态转场动画、以HBNavigation*命名的是导航动画转场
 */
@interface HBBaseAnimationTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationTransitionType type;
/**
 *  导航控制器transition操作    如果子类实现导航的transition动画，子类需重写此方法
 *
 *  @param operation 导航transition方式
 *
 *  @return 提供transition动画对象
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForNavitionOperation:(UINavigationControllerOperation)operation;


@end


NS_ASSUME_NONNULL_END