//
//  ViewController.m
//  XJAVPlayer
//
//  Created by xj_love on 16/9/1.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "ViewController.h"
#import "XJAVPlayer.h"

@interface ViewController ()<XJAVPlayerDelegate,UIScrollViewDelegate>{
    XJAVPlayer *myPlayer;
    UIScrollView *scroll;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    myPlayer = [[XJAVPlayer alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    myPlayer.delegate = self;
    myPlayer.xjPlayerUrl = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
//    [self.view addSubview:myPlayer];
    
    scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scroll.delegate = self;
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+400);
    [scroll addSubview:myPlayer];
    
    [self.view addSubview:scroll];
    
    NSLog(@"%@",[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];//注册监听，屏幕方向改变
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//     NSLog(@"%f",scrollView.contentOffset.y + myPlayer.frame.origin.y);
    if (scrollView.contentOffset.y + myPlayer.frame.origin.y == 100) {
        NSLog(@"%f",scrollView.contentOffset.y - myPlayer.frame.origin.y);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"top" object:nil];
        [scrollView addSubview:myPlayer];
    }
}
#pragma mark - 屏幕方向改变的监听
//屏幕方向改变时的监听
- (void)orientChange:(NSNotification *)notification{
    UIDeviceOrientation orient = [[UIDevice currentDevice] orientation];
    switch (orient) {
        case UIDeviceOrientationPortrait:            // Device oriented vertically, home button on the bottom
        {
            scroll.frame = self.view.frame;
        }
            break;
        case UIDeviceOrientationLandscapeLeft:      // Device oriented horizontally, home button on the right
        {
            scroll.frame = self.view.window.bounds;
        }
            break;
        case UIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left
        {
            scroll.frame = self.view.window.bounds;
        }
            break;
        default:
            break;
    }
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
