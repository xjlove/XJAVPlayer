//
//  SCYLayerAddition.m
//  MoneyMore
//
//  Created by old lang on 15-3-25.
//  Copyright (c) 2015年 ___9188___. All rights reserved.
//

#import "SCYLayerAddition.h"

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CALayer (SCYCategory)

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

@implementation SCYBorderLayer

+ (instancetype)layer {
    SCYBorderLayer *layer = [super layer];
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.customBorderColor = [UIColor blackColor];
    layer.customBorderWidth = 1.0;
    layer.contentsScale = [UIScreen mainScreen].scale;
    return layer;
}

- (void)setCustomBorderStyle:(SCYBorderStyle)customBorderStyle {
    if (_customBorderStyle != customBorderStyle) {
        _customBorderStyle = customBorderStyle;
        [self setNeedsDisplay];
    }
}

- (void)setCustomBorderColor:(UIColor *)customBorderColor {
    _customBorderColor = customBorderColor;
    [self setNeedsDisplay];
}

- (void)setCustomBorderWidth:(CGFloat)customBorderWidth {
    if (_customBorderWidth != customBorderWidth) {
        _customBorderWidth = customBorderWidth;
        [self setNeedsDisplay];
    }
}

- (void)setBorderInsets:(UIEdgeInsets)borderInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_borderInsets, borderInsets)) {
        _borderInsets = borderInsets;
        [self setNeedsDisplay];
    }
}

- (void)drawInContext:(CGContextRef)ctx {
    if (_customBorderStyle == SCYBorderStyleleNone) {
        return;
    }
    CGContextSetStrokeColorWithColor(ctx, _customBorderColor.CGColor);
    CGContextSetLineWidth(ctx, _customBorderWidth);
    
    if ((_customBorderStyle & SCYBorderStyleTop) == SCYBorderStyleTop) {
        CGContextMoveToPoint(ctx, _borderInsets.left, _borderInsets.top);
        CGContextAddLineToPoint(ctx, self.width - _borderInsets.right, _borderInsets.top);
    }
    if ((_customBorderStyle & SCYBorderStyleLeft) == SCYBorderStyleLeft) {
        CGContextMoveToPoint(ctx, _borderInsets.left, _borderInsets.top);
        CGContextAddLineToPoint(ctx, _borderInsets.left, self.height - _borderInsets.bottom);
    }
    if ((_customBorderStyle & SCYBorderStyleBottom) == SCYBorderStyleBottom) {
        CGContextMoveToPoint(ctx, _borderInsets.left, self.height - _borderInsets.bottom);
        CGContextAddLineToPoint(ctx, self.width - _borderInsets.right, self.height - _borderInsets.bottom);
    }
    if ((_customBorderStyle & SCYBorderStyleRight) == SCYBorderStyleRight) {
        CGContextMoveToPoint(ctx, self.width - _borderInsets.right, _borderInsets.top);
        CGContextAddLineToPoint(ctx, self.width - _borderInsets.right, self.height - _borderInsets.bottom);
    }
    CGContextStrokePath(ctx);
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CALayer (SCYScreenshot)

- (UIImage *)scy_takeScreenShot {
    return [self scy_takeScreenShotWithSize:self.size opaque:YES scale:0];
}

- (UIImage *)scy_takeScreenShotWithSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    [self renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

@end
