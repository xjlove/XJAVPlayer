//
//  UIDevice+XJDevice.h
//  XJAVPlayer
//
//  Created by xj_love on 16/9/5.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (XJDevice)
/**
 *  强制旋转设备
 *  @param  旋转方向
 */
+ (void)setOrientation:(UIInterfaceOrientation)orientation;
@end
