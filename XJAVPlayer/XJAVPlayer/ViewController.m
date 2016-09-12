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
    
    myPlayer = [[XJAVPlayer alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
    myPlayer.delegate = self;
    myPlayer.xjPlayerUrl = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    
    [self.view addSubview:myPlayer];//(看自动缩小就把它注释了)
    
    //想看自动缩小就把注释开了
//    [myPlayer addXJPlayerAutoMovie];//添加自动缩到右下角（播放/小屏的时候才管用。此功能慎用；）
//    scroll = [[UIScrollView alloc] init];
//    scroll.delegate = self;
//    [scroll addSubview:myPlayer];
//    [self.view addSubview:scroll];
}

//- (void)viewDidLayoutSubviews{
//    scroll.frame = self.view.frame;
//    scroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+400);
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    //如果添加了自动缩到右下角，在scrollView的代理里面还在加上这句；
//    if (scrollView.contentOffset.y - myPlayer.originalFrame.origin.y <= 0) {
//        [myPlayer movieXJPlayeToOriginalPosition];
//        [scrollView addSubview:myPlayer];
//    }
//}

#pragma mark - xjAVPlayer代理
- (void)nextXJPlayer{
    myPlayer.xjPlayerUrl = @"http://www.jxgbwlxy.gov.cn/tm/course/041629011/sco1/1.mp4";
}

- (void)xjPlayerFullOrSmall:(BOOL)flag{
    
    //如果xjPlayer的界面有导航栏或者有tabbar,在全屏代理方法里全屏时进行如下隐藏；
    if (flag) {
        self.navigationController.navigationBarHidden = YES;
        self.tabBarController.tabBar.hidden = YES;
    }else{
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = YES;
    }
    
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
