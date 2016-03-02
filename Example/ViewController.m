//
//  ViewController.m
//  NinaCycleBannerView
//
//  Created by RamWire on 16/2/26.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import "ViewController.h"
#import "NinaBannerView.h"
//
//全屏宽和高大小
#define FUll_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//十六进制颜色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nina";
    //不透明
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    /**<  本地图片   **/
    NSArray *myLocalArray = @[
                              @"1.jpg",
                              @"2.jpg",
                              @"3.jpg",
                              @"4.jpg",
                              @"5.jpg",
                              @"6.jpg",
                              @"7.jpg"
                            ];
    /**<  网络图片   **/
    NSArray *myWebArray = @[
                         @"http://z.abang.com/d/dongman/1/3/3/X/-/-/duolaameng.jpg",
                         @"http://upload-images.jianshu.io/upload_images/132114-efbfcc01674c6b25.jpg?imageView2/2/w/1240/q/100",
                         @"http://upload-images.jianshu.io/upload_images/132114-f42cac262b9b6a6a.jpg?imageView2/2/w/1240/q/100",
                         @"http://upload-images.jianshu.io/upload_images/132114-43eac6a00b6397d2.jpg?imageView2/2/w/1240/q/100",
                         @"http://upload-images.jianshu.io/upload_images/132114-35b4acc945d615a1.jpg?imageView2/2/w/1240/q/100",
                         @"http://upload-images.jianshu.io/upload_images/132114-c2a07e52504e7b81.jpg?imageView2/2/w/1240/q/100",
                         @"http://upload-images.jianshu.io/upload_images/132114-68a63c1192691868.jpg?imageView2/2/w/1240/q/100"
                         ];
    /**<  点击Url   **/
    NSArray *urlArray = @[
                          @"https://github.com/",
                          @"http://nba.hupu.com/",
                          @"http://v2ex.com/",
                          @"https://www.baidu.com/",
                          @"http://www.jianshu.com/",
                          @"http://stackoverflow.com/",
                          @"http://www.jpfans.com/"
                          ];
    NinaBannerView *bannerView = [[NinaBannerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT / 2) WithCycleStyle:NinaCycleStyleVertical WithBannerSource:NinaBannerStyleLocalSource WithBannerArray:myLocalArray];
    bannerView.showPageControl = YES;
    /**<  如果是在Horizontal下，可以对pageControl的选中未选中颜色进行设置   **/
    bannerView.currentPageIndicatorTintColor = [UIColor blackColor];
    bannerView.pageIndicatorTintColor = [UIColor yellowColor];
    /**<  如果有点击图片时间的需求，可以在这里传入数据   **/
    bannerView.bannerUrlArray = urlArray;    
    [self.view addSubview:bannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
