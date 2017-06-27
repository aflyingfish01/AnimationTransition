//
//  HBModalPushPopAnimation.m
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBModalPushPopAnimation.h"

@implementation HBModalPushPopAnimation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    switch (self.type) {
        case AnimationTransitionType_Present:
        {
            [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
            CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
            toViewController.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0);
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                toViewController.view.frame = finalFrame;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        }
            break;
        case AnimationTransitionType_Dismiss:
        {
            CGRect initFrame = [transitionContext initialFrameForViewController:fromViewController];
            CGRect finalFrame = CGRectOffset(initFrame, screenBounds.size.width, 0);
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                fromViewController.view.frame = finalFrame;
            } completion:^(BOOL finished) {
            
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
            break;
        default:
            break;
    }
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25f;
}


@end
