//
//  UIButton+Blocks.h
//  LCKitDemo
//
//  Created by linhua on 15/11/3.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (Blocks)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;


@end
