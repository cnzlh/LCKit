//
//  UITableViewCell+LCExtension.m
//  Pods
//
//  Created by linhua on 15/11/24.
//
//

#import "UITableViewCell+LCExtension.h"

@implementation UITableViewCell (LCExtension)

- (void)delayContentTouches:(BOOL)value {
    //ios7上UITableViewCell子层容器是UITableViewCellScrollView
    for (id obj in self.subviews)
    {
        if ([NSStringFromClass([obj class]) isEqualToString:@"UITableViewCellScrollView"])
        {
            UIScrollView *scroll = (UIScrollView *) obj;
            
            scroll.delaysContentTouches = value;
            break;
        }
    }
}

@end
