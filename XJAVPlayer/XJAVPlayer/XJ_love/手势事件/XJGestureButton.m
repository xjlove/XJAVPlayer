//
//  XJGestureButton.m
//  XJAVPlayer
//
//  Created by xj_love on 16/9/6.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "XJGestureButton.h"

@implementation XJGestureButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addGestureAction];
    }
    return self;
}

- (void)addGestureAction{
    UITapGestureRecognizer *xjTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHidenMenuView:)];
    xjTapGesture.numberOfTapsRequired = 1;
    xjTapGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:xjTapGesture];
    
    UITapGestureRecognizer *xjTwoTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playOrPauseAction:)];
    xjTwoTapGesture.numberOfTapsRequired = 2;
    xjTwoTapGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:xjTwoTapGesture];
    
    [xjTapGesture requireGestureRecognizerToFail:xjTwoTapGesture];//没有检测到双击才进行单击事件
}

- (void)showOrHidenMenuView:(UITapGestureRecognizer*)tap{
    [self.touchDelegate userTapGestureAction:tap];
}

- (void)playOrPauseAction:(UITapGestureRecognizer*)tap{
    [self.touchDelegate userTapGestureAction:tap];
}

//触摸开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    //获取触摸开始的坐标
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
    [self.touchDelegate touchesBeganWithPoint:currentP];
}

//触摸结束
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
    [self.touchDelegate touchesEndWithPoint:currentP];
}

//移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentP = [touch locationInView:self];
    [self.touchDelegate touchesMoveWithPoint:currentP];
}


@end
