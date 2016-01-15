//
//  UIViewController+LCExtension.m
//  Pods
//
//  Created by linhua on 15/11/23.
//
//

#import "UIViewController+LCExtension.h"

@implementation UIViewController (LCExtension)

- (void)resignKeyBoardInView:(UIView *)view
{
    for (UIView *v in view.subviews) {
        if ([v.subviews count] > 0) {
            [self resignKeyBoardInView:v];
        }
        
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]]) {
            [v resignFirstResponder];
        }
    }
}

- (BOOL)isVisible {
    return (self.isViewLoaded && self.view.window);
}

@end
