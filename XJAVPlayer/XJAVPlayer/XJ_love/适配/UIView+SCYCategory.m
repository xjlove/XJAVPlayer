//
//  UIView+SCYCategory.m
//  ProvidentFund
//
//  Created by cdd on 15/12/9.
//  Copyright © 2015年 9188. All rights reserved.
//

#import "UIView+SCYCategory.h"
#import <objc/runtime.h>

@implementation UIView (SCYCategory)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGPoint)leftTop {
    return CGPointMake(self.left, self.top);
}

- (void)setLeftTop:(CGPoint)leftTop {
    self.left = leftTop.x;
    self.top = leftTop.y;
}

- (CGPoint)leftBottom {
    return CGPointMake(self.left, self.bottom);
}

- (void)setLeftBottom:(CGPoint)leftBottom {
    self.left = leftBottom.x;
    self.bottom = leftBottom.y;
}

- (CGPoint)rightTop {
    return CGPointMake(self.right, self.top);
}

- (void)setRightTop:(CGPoint)rightTop {
    self.right = rightTop.x;
    self.top = rightTop.y;
}

- (CGPoint)rightBottom {
    return CGPointMake(self.right, self.bottom);
}

- (void)setRightBottom:(CGPoint)rightBottom {
    self.right = rightBottom.x;
    self.bottom = rightBottom.y;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

static const void *kBackViewIdentifier = &kBackViewIdentifier;

@implementation UIView (SCYBackView)

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
                   animation:(void(^)(void))animation
                timeInterval:(NSTimeInterval)interval
                   fininshed:(void(^)(BOOL finished))fininshed{
    [self showViewWithBackView:view
                         alpha:a
                        target:target
                   touchAction:selector];
    [UIView animateWithDuration:interval
                     animations:animation
                     completion:fininshed];
}

- (void)showViewWithBackView:(UIView *)view
                       alpha:(CGFloat)a
                      target:(id)target
                 touchAction:(SEL)selector
{
    UIView* backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = a;
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [backView addGestureRecognizer:gesture];
    
    objc_setAssociatedObject(self, kBackViewIdentifier, backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addSubview:backView];
    [self addSubview:view];
}

- (void)hideBackViewForView:(UIView *)view
                  animation:(void(^)(void))animation
               timeInterval:(NSTimeInterval)interval
                  fininshed:(void(^)(BOOL complation))fininshed{
    [UIView animateWithDuration:interval
                     animations:animation
                     completion:^(BOOL finish){
                         [self hideBackViewForView:view];
                         if (fininshed) {
                             fininshed(finish);
                         }
                     }];
}

- (void)hideBackViewForView:(UIView *)view{
    UIView* backView = objc_getAssociatedObject(self, kBackViewIdentifier);
    [view removeFromSuperview];
    [backView removeFromSuperview];
}

//////////////////////////////////////////////////////////////
- (void)showView:(UIView *)view backViewAlpha:(CGFloat)a target:(id)target touchAction:(SEL)selector animation:(void(^)(void))animation timeInterval:(NSTimeInterval)interval finished:(void(^)(BOOL finished))fininshed{
    [self showView:view
                         backViewAlpha:a
                        target:target
                   touchAction:selector];
    [UIView animateWithDuration:interval
                     animations:animation
                     completion:fininshed];
}

- (void)showView:(UIView *)view backViewAlpha:(CGFloat)a target:(id)target touchAction:(SEL)selector{
    UIView* backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor=[UIColor colorWithWhite:0 alpha:a];
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [backView addGestureRecognizer:gesture];
    
    [self addSubview:backView];
    [self addSubview:view];
    objc_setAssociatedObject(self, kBackViewIdentifier, backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hideView:(UIView *)view animation:(void(^)(void))animation timeInterval:(NSTimeInterval)interval fininshed:(void(^)(BOOL complation))fininshed{
    [UIView animateWithDuration:interval
                     animations:animation
                     completion:^(BOOL finish){
                         [self hideView:view];
                         if (fininshed) {
                             fininshed(finish);
                         }
                     }];
}

- (void)hideView:(UIView *)view{
    UIView* backView = objc_getAssociatedObject(self, kBackViewIdentifier);
    [view removeFromSuperview];
    [backView removeFromSuperview];
}

- (UIView*)backView{
    UIView* backView = objc_getAssociatedObject(self, kBackViewIdentifier);
    return backView;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

static const void *kDefaultWatermarkKey = &kDefaultWatermarkKey;
static const NSTimeInterval kAnimationDuration = 0.25;

@implementation UIView (SCYWatermark)

- (void)showWatermark:(NSString *)imageName animated:(BOOL)animated Target:(id)target Action:(SEL)action {
    UIImageView *watermark = [self watermark:imageName];
    if (!watermark.superview) {
        if (action) {
            watermark.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
            [watermark addGestureRecognizer:tapGesture];
        }
        [self addSubview:watermark];
        watermark.alpha = 0;
        [UIView animateWithDuration:(animated ? kAnimationDuration : 3) animations:^{
            watermark.alpha = 1;
        } completion:nil];
    }
}

- (void)showDefaultWatermark:(BOOL)animated Target:(id)target Action:(SEL)action {
    [self showWatermark:@"nonedata" animated:animated Target:(id)target Action:(SEL)action];
}

- (void)hideWatermark:(BOOL)animated {
    UIImageView *watermark = [self watermark:nil];
    if (watermark && watermark.superview) {
        [UIView animateWithDuration:(animated ? kAnimationDuration : 0) animations:^{
            watermark.alpha = 0;
        } completion:^(BOOL finished) {
            [watermark removeFromSuperview];
            if (watermark.gestureRecognizers.count!=0) {
                UIGestureRecognizer *gesrure = [watermark.gestureRecognizers objectAtIndex:0];
                if (gesrure) {
                    [watermark removeGestureRecognizer:gesrure];
                }
            }
        }];
    }
}

- (UIImageView *)watermark:(NSString *)name {
    UIImageView *watermark = objc_getAssociatedObject(self, kDefaultWatermarkKey);
    if (watermark) {
        return watermark;
    }
    if (!watermark && name.length) {
        UIImage *image = [UIImage imageNamed:name];
        watermark = [[UIImageView alloc] initWithImage:image];
        watermark.size = image.size;
        watermark.center = CGPointMake(self.width * 0.5, self.height * 0.5);
        objc_setAssociatedObject(self, kDefaultWatermarkKey, watermark, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return watermark;
    }
    return nil;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

static const void *kBorderLayerKey  = &kBorderLayerKey;

@implementation UIView (SCYBorder)

- (void)scy_setBorderStyle:(SCYBorderStyle)customBorderStyle {
    [[self scy_borderLayer] setCustomBorderStyle:customBorderStyle];
}

- (SCYBorderStyle)scy_borderStyle {
    return [[self scy_borderLayer] customBorderStyle];
}

- (void)scy_setBorderColor:(UIColor *)color {
    [[self scy_borderLayer] setCustomBorderColor:color];
}

- (UIColor *)scy_borderColor {
    return [[self scy_borderLayer] customBorderColor];
}

- (void)scy_setBorderWidth:(CGFloat)with {
    [[self scy_borderLayer] setCustomBorderWidth:with];
}

- (CGFloat)scy_borderWidth {
    return [[self scy_borderLayer] customBorderWidth];
}

- (void)scy_setBorderInsets:(UIEdgeInsets)insets {
    [[self scy_borderLayer] setBorderInsets:insets];
}

- (UIEdgeInsets)scy_borderInsets {
    return [[self scy_borderLayer] borderInsets];
}

- (void)scy_relayoutBorder {
    [self scy_borderLayer].frame = self.layer.bounds;
}

- (SCYBorderLayer *)scy_borderLayer {
    SCYBorderLayer *layer = objc_getAssociatedObject(self, kBorderLayerKey);
    if (!layer) {
        layer = [SCYBorderLayer layer];
        layer.frame = self.layer.bounds;
        [self.layer addSublayer:layer];
        objc_setAssociatedObject(self, kBorderLayerKey, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return layer;
}

@end
