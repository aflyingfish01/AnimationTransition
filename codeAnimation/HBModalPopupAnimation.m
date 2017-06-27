//
//  HBModalTapAnimation.m
//  HBUserFeedback
//
//  Created by Walker on 16/5/12.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBModalPopupAnimation.h"

@interface HBModalPopupAnimation ()
@property(nonatomic)UIView * coverView;
@property(nonatomic)id<UIViewControllerContextTransitioning> context;
@property(nonatomic,weak)UIViewController * modalViewController;
@end

@implementation HBModalPopupAnimation


-(void)tap:(UITapGestureRecognizer *)sender{
    if (self.modalViewController) {
        CGPoint tapPoint=  [sender locationInView:self.modalViewController.view.superview];
        if (!CGRectContainsPoint(self.modalViewController.view.frame, tapPoint)) {
            [self.modalViewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.context = transitionContext;
    UIView * container = [transitionContext containerView];
    CGSize Screen_Size = [[UIScreen mainScreen] bounds].size;
    switch (self.type) {
        case AnimationTransitionType_Present:
        {
            
            UIView * modalView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
            self.modalViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            if (!self.coverView) {
                self.coverView = [[UIView alloc]init];
                self.coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
                self.coverView.alpha = 0;
                self.coverView.frame = container.frame;
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
                tap.numberOfTapsRequired = 1;
                [self.coverView addGestureRecognizer:tap];
            }else
            {
                self.coverView.frame = container.frame;
            }
            [container addSubview:self.coverView];
            modalView.frame = CGRectInset(container.frame, 60, 60);
            CGPoint endPoint = modalView.center;
            modalView.center = CGPointMake(endPoint.x, endPoint.y+Screen_Size.height);
            [container addSubview:modalView];
            [container bringSubviewToFront:modalView];
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^{
                modalView.center = endPoint;
                self.coverView.alpha = 1;
                
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
        }
            break;
        case AnimationTransitionType_Dismiss:
        {
            UIView * modalView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
            
            CGPoint startPoint = modalView.center;
            [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                modalView.center = CGPointMake(startPoint.x, startPoint.y+Screen_Size.height);
                self.coverView.alpha  = 0;
            } completion:^(BOOL finished) {
                [self.coverView removeFromSuperview];
                [modalView removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];
        }
            break;
            
        default:
            break;
    }
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

@end
