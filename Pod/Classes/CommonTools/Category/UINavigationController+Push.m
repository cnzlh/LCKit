//
//  UINavigationController+Push.m
//  iDoris
//
//  Created by linhua on 13-11-11.
//  Copyright (c) 2015年 linhua. All rights reserved.
//

#import "UINavigationController+Push.h"
#import <QuartzCore/QuartzCore.h>


@implementation UINavigationController (Push)

- (void)pushViewController:(UIViewController *)viewController inViewController:(UIViewController *)inController fromDirection:(TransitionDirection)direction{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    
    switch (direction) {
        case DirectionFromLeft:
            transition.subtype = kCATransitionFromLeft;
            break;
        case DirectionFromRight:
            transition.subtype = kCATransitionFromRight;
            break;
        case DirectionFromTop:
            transition.subtype = kCATransitionFromTop;
            break;
        case DirectionFromBottom:
            transition.subtype = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    
    transition.delegate = self;
    [inController.navigationController.view.layer addAnimation:transition forKey:nil];
    inController.navigationController.navigationBarHidden = NO;
    [inController.navigationController pushViewController:viewController animated:NO];
}

- (void)popInViewController:(UIViewController *)controller fromDirection:(TransitionDirection)direction{
    
    CATransition *transition = [CATransition animation];
    transition.duration =0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    switch (direction) {
        case DirectionFromLeft:
            transition.subtype = kCATransitionFromLeft;
            break;
        case DirectionFromRight:
            transition.subtype = kCATransitionFromRight;
            break;
        case DirectionFromTop:
            transition.subtype = kCATransitionFromTop;
            break;
        case DirectionFromBottom:
            transition.subtype = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    
    transition.delegate = self;
    [controller.navigationController.view.layer addAnimation:transition forKey:nil];
    controller.navigationController.navigationBarHidden = NO;
    [controller.navigationController popViewControllerAnimated:NO];
    
}

- (void)pushViewController:(UIViewController *)viewController inViewController:(UIViewController *)inController animated:(BOOL)animated backButtonTitle:(NSString *)title {
    inController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
    [inController.navigationController pushViewController:viewController animated:animated];
}

@end
