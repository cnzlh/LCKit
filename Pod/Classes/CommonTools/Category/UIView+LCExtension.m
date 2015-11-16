//
//  UIView+LCExtension.m
//  LCKitDemo
//
//  Created by linhua on 15/11/12.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import "UIView+LCExtension.h"

@implementation UIView (LCExtension)

- (void)printViewHierarchy {
    static uint level = 0;
    for(uint i = 0; i < level; i++){
        printf("\t");
    }
    
    const char *className = NSStringFromClass([self class]).UTF8String;
    const char *frame = NSStringFromCGRect(self.frame).UTF8String;
    printf("%s:%s\n", className, frame);
    
    ++level;
    for(UIView *view in self.subviews){
        [view printViewHierarchy];
    }
    --level;
}

+ (UIView *) dotView:(CGRect) frame WithColor:(UIColor *) color{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.layer.cornerRadius = frame.size.width / 2;
    view.backgroundColor = color;
    return view;
}

@end
