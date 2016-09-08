//
//  XJAVPlayer.h
//  XJAVPlayer
//
//  Created by xj_love on 16/9/1.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XJGestureButton;

@protocol XJAVPlayerDelegate <NSObject>
@optional

/**************************** 代理方法 *************************************/

/**
 *  代理，是否全屏
 *
 *  @param flag YES：全屏，NO：不是全屏；
 */
- (void)xjPlayerFullOrSmall:(BOOL)flag;
/**
 *  代理，视屏是否暂停
 *
 *  @param flag flag YES：暂停，NO：播放；
 */
- (void)xjPlayerPlayOrPause:(BOOL)flag;
/**
 *  代理，下一个视屏（全屏的时候才有）
 */
- (void)nextXJPlayer;

@end

@interface XJAVPlayer : UIView

@property (nonatomic, strong) id<XJAVPlayerDelegate> delegate;

/**************************** 外部接口 *************************************/
/**
 *  视屏链接
 */
@property (nonatomic, strong) NSString *xjPlayerUrl;
/**
 *  如果想自己写底部菜单，可以移除我写好的菜单；然后通过接口和代理来控制视屏；
 */
- (void)removeXJPlayerBottomMenu;
/**
 *  如果自己添加菜单，建议添加到这个button上；
 */
@property (strong, nonatomic) XJGestureButton *xjGestureButton;
/**
 *  添加,视屏view位置超出屏幕时，位置移到右下角；（慎用，还在完善）
 */
- (void)addXJPlayerAutoMovie;
/**
 *  暂停
 */
- (void)pause;
/**
 *  开始
 */
- (void)play;
/**
 * 定位视频播放时间(根据上次存储的时间来定位播放)
 *
 * @param seconds 秒
 *
 *
 */
- (void)seekToTimeWithSeconds:(Float64)seconds;
/**
 * 取得当前播放时间
 *
 */
- (Float64)currentTime;
/**
 * 取得媒体总时长
 *
 */
- (Float64)totalTime;

@end
