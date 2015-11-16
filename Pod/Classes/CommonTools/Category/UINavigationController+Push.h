//
//  UINavigationController+Push.h
//  iDoris
//
//  Created by linhua on 15-11-11.
//  Copyright (c) 2013年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    DirectionFromLeft = 0,
    DirectionFromRight,
    DirectionFromTop,
    DirectionFromBottom
}TransitionDirection;


@interface UINavigationController (Push)

/**
 *  自定义pushViewController方向
 *
 */
- (void)pushViewController:(UIViewController *)nextViewController inViewController:(UIViewController *)inController fromDirection:(TransitionDirection)direction;

- (void)popInViewController:(UIViewController *)controller fromDirection:(TransitionDirection)direction;

@end
