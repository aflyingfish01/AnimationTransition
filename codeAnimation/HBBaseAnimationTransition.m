//
//  HBBaseAnimationTransiton.m
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBBaseAnimationTransition.h"

@implementation HBBaseAnimationTransition

-(void)animationEnded:(BOOL)transitionCompleted
{
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForNavitionOperation:(UINavigationControllerOperation)operation  {
    return nil;
}


@end
