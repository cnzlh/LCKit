//
//  UITableViewCell+LCExtension.h
//  Pods
//
//  Created by linhua on 15/11/24.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (LCExtension)

//tableviewcell上添加button,button快速点击的话,没有点击效果的处理。将value设置为NO
- (void)delayContentTouches:(BOOL)value;

@end
