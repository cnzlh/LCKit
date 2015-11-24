//
//  UITableView+LCExtension.m
//  LCKitDemo
//
//  Created by linhua on 15/11/11.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import "UITableView+LCExtension.h"

@implementation UITableView (LCExtension)

- (void)hideExtraCellLine
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

- (void)delayContentTouches:(BOOL)value {
    self.delaysContentTouches = value;
    if ([UIDevice currentDevice].systemVersion.intValue >= 8) {
        for (UIView *currentView in self.subviews) {
            if ([currentView isKindOfClass:[UIScrollView class]]) {
                ((UIScrollView *)currentView).delaysContentTouches = value;
                break;
            }
        }
    }
}

//如果滑动tableView的时候,触碰区域正好在按钮上的话,是滑动不了的,通过这个方法解决
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return YES;
}

@end
