//
//  HBModalNormalAnimation.m
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBModalNormalAnimation.h"

@implementation HBModalNormalAnimation


#pragma mark - UIViewControllerAnimatedTransitioning
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (self.type == AnimationTransitionType_Present) {

        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];

        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        
        CGRect finalFrame = CGRectMake(0, 0, screenSize.width, screenSize.height);

        toViewController.view.frame = CGRectOffset(finalFrame, 0, containerView.bounds.size.height);
        toViewController.view.frame = finalFrame;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }else{
        CGRect initFrame = [transitionContext initialFrameForViewController:fromViewController];
        CGRect finalFrame = CGRectOffset(initFrame, 0, containerView.bounds.size.height);
        fromViewController.view.frame = finalFrame;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        //如果有必要可以记录下目标控制器
    }
    if ([toViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)toViewController;
        if (self.type == AnimationTransitionType_Present) {
            [nav setNavigationBarHidden:YES animated:NO];
        } else if (self.type == AnimationTransitionType_Dismiss) {
            [nav setNavigationBarHidden:NO animated:YES];
        }
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case AnimationTransitionType_Dismiss:
            return 0.25;
            break;
        case AnimationTransitionType_Present:
            return 0.25;
            break;
        default:
            return [super transitionDuration:transitionContext];
    }
}

- (void)animationEnded:(BOOL) transitionCompleted{
    [super animationEnded:transitionCompleted];
    
}


@end
