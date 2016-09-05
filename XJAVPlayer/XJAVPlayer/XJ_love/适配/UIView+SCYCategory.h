//
//  UIView+SCYCategory.h
//  ProvidentFund
//
//  Created by cdd on 15/12/9.
//  Copyright © 2015年 9188. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCYLayerAddition.h"

@interface UIView (SCYCategory)

//  左边间距
@property (nonatomic) CGFloat left;

//  顶部间距
@property (nonatomic) CGFloat top;

//  右边间距
@property (nonatomic) CGFloat right;

//  底部间距
@property (nonatomic) CGFloat bottom;

//  左上角
@property (nonatomic) CGPoint leftTop;

//  左下角
@property (nonatomic) CGPoint leftBottom;

//  右上角
@property (nonatomic) CGPoint rightTop;

//  右下角
@property (nonatomic) CGPoint rightBottom;

//  宽度
@property (nonatomic) CGFloat width;

//  高度
@property (nonatomic) CGFloat height;

//  X轴中心点
@property (nonatomic) CGFloat centerX;

//  Y轴中心点
@property (nonatomic) CGFloat centerY;

//  原点
@property (nonatomic) CGPoint origin;

//  大小
@property (nonatomic) CGSize size;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIView (SCYBackView)

@property (nonatomic,readonly)UIView* backView;

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector;

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed;

- (void)hideBackViewForView:(UIView *)view
                  animation:(void(^)(void))animation
               timeInterval:(NSTimeInterval)interval
                  fininshed:(void(^)(BOOL complation))fininshed;

- (void)hideBackViewForView:(UIView *)view;

//////////////////////////////////////////////////////////////
- (void)showView:(UIView *)view
   backViewAlpha:(CGFloat)a
          target:(id)target
     touchAction:(SEL)selector
       animation:(void(^)(void))animation
    timeInterval:(NSTimeInterval)interval
        finished:(void(^)(BOOL finished))fininshed;

- (void)showView:(UIView *)view
   backViewAlpha:(CGFloat)a
          target:(id)target
     touchAction:(SEL)selector;

- (void)hideView:(UIView *)view
       animation:(void(^)(void))animation
    timeInterval:(NSTimeInterval)interval fininshed:(void(^)(BOOL complation))fininshed;

- (void)hideView:(UIView *)view;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIView (SCYWatermark)

- (void)showWatermark:(NSString *)imageName animated:(BOOL)animated Target:(id)target Action:(SEL)action;

- (void)showDefaultWatermark:(BOOL)animated Target:(id)target Action:(SEL)action;

- (void)hideWatermark:(BOOL)animated;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////


@interface UIView (SCYBorder)

//  设置边框线类型
- (void)scy_setBorderStyle:(SCYBorderStyle)customBorderStyle;

//  边框线类型
- (SCYBorderStyle)scy_borderStyle;

//  设置边框线颜色
- (void)scy_setBorderColor:(UIColor *)color;

//  边框线颜色
- (UIColor *)scy_borderColor;

//  设置边框线宽度
- (void)scy_setBorderWidth:(CGFloat)with;

//  边框线宽度
- (CGFloat)scy_borderWidth;

//  设置边框线内凹
- (void)scy_setBorderInsets:(UIEdgeInsets)insets;

//  边框线内凹
- (UIEdgeInsets)scy_borderInsets;

//  重新布局边框线，如果在设置了边框线之后view的大小发生变化，需要调用此方法
- (void)scy_relayoutBorder;

@end
