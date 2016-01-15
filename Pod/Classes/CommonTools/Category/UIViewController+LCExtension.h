//
//  UIViewController+LCExtension.h
//  Pods
//
//  Created by linhua on 15/11/23.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (LCExtension)

/**
 *  消除键盘
 */
- (void)resignKeyBoardInView:(UIView *)view;

/**
 *  当前ViewController是否正在显示
 *
 *  @return 是否正在显示，YES表示显示，NO表示未显示
 */
- (BOOL)isVisible;

@end
