//
//  UITableView+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/11.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (LCExtension)

//隐藏多余的分割线
- (void)hideExtraCellLine;

//tableviewcell上添加button,button快速点击的话,没有点击效果的处理。将value设置为NO
- (void)delayContentTouches:(BOOL)value;

@end
