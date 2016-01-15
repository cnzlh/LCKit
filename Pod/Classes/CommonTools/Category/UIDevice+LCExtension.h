//
//  UIDevice+LCExtension.h
//  Pods
//
//  Created by linhua on 16/1/15.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (LCExtension)

/**
 *	@brief	获取本地wifi的ip地址
 *
 *	@return	WIFI的IP地址
 */
- (NSString *)localWiFiIPAddress;

/**
 获取网卡的硬件地址(MAC地址)
 */
- (NSString *) macAddress;

@end
