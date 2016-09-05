//
//  ViewController.m
//  XJAVPlayer
//
//  Created by xj_love on 16/9/1.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "ViewController.h"
#import "XJAVPlayer.h"

@interface ViewController ()<XJAVPlayerDelegate>{
    XJAVPlayer *myPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    myPlayer = [[XJAVPlayer alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
    myPlayer.delegate = self;
    myPlayer.xjPlayerUrl = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    [self.view addSubview:myPlayer];
    
}

- (void)haha{
    NSLog(@"haha");
}
#pragma mark - xjAVPlayer代理
- (void)nextXJPlayer{
    myPlayer.xjPlayerUrl = @"http://www.jxgbwlxy.gov.cn/tm/course/041629011/sco1/1.mp4";
}

- (void)xjPlayerFullOrSmall:(BOOL)flag{
    if (flag) {
        /**
         *  全屏时隐藏顶部状态栏。由于iOS7.0后，如果你的plist文件已经设置View controller-based status bar appearance，value设为NO，就不用写下面的代码（我已经封装好）,如果没设置，就把下面的代码放开，就能在全屏时隐藏头部状态栏；
         */
//        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }else{
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
