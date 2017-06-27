//
//  HBNavigationPopAnimation.m
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBNavigationPopAnimation.h"

@implementation HBNavigationPopAnimation

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForNavitionOperation:(UINavigationControllerOperation)operation {
    switch (operation) {
        case UINavigationControllerOperationPop:
            self.type = AnimationTransitionType_Pop;
            return self;
        default:
            return nil;
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case AnimationTransitionType_Pop:
            return 0.25;
        default:
            return [super transitionDuration:transitionContext];
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case AnimationTransitionType_Push:
        {
            
        }
            break;
        case AnimationTransitionType_Pop:
        {
            UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            UIView *containerView = [transitionContext containerView];
            [containerView addSubview:toViewController.view];
            [containerView sendSubviewToBack:toViewController.view];
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
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

- (void)animationEnded:(BOOL)transitionCompleted {
    [super animationEnded:transitionCompleted];
}

@end
