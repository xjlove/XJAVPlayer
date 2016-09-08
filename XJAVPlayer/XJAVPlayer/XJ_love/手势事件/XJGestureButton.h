//
//  XJGestureButton.h
//  XJAVPlayer
//
//  Created by xj_love on 16/9/6.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XJGestureButtonDelegate <NSObject>
/**
 * 开始触摸
 */
- (void)touchesBeganWithPoint:(CGPoint)point;

/**
 * 结束触摸
 */
- (void)touchesEndWithPoint:(CGPoint)point;

/**
 * 移动手指
 */
- (void)touchesMoveWithPoint:(CGPoint)point;

/**
 *  单击时/双击时,判断tap的numberOfTapsRequired
 */
- (void)userTapGestureAction:(UITapGestureRecognizer*)xjTap;

@end

@interface XJGestureButton : UIButton

/**
 * 传递点击事件的代理
 */
@property (weak, nonatomic) id <XJGestureButtonDelegate> touchDelegate;

@end
