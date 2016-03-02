//
//  NinaBannerView.m
//  NinaCycleBannerView
//
//  Created by RamWire on 16/2/26.
//  Copyright © 2016年 RamWire. All rights reserved.
//
///
#import "NinaBannerView.h"
#import "UIView+ViewController.h"
#import "UIImageView+WebCache.h"

@interface NinaBannerView ()
@property (nonatomic, strong) UIPageControl *pageControl; /**<  下方显示页数   **/
@property (nonatomic, strong) UIScrollView *ninaScrollView; /**<  轮播图   **/
@end
//全屏宽和高大小
#define FUll_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//十六进制颜色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation NinaBannerView {
    CGFloat SELFWIDTH;
    CGFloat SELFHEIGHT;
    NSInteger totalNumber;
    NSTimer *myTimer;
    NSTimer *yourTimer;
    NSInteger currentPage;
    NSInteger isScrollHori;
}

- (instancetype)initWithFrame:(CGRect)frame WithCycleStyle:(NinaCycleStyle)cycleStyle WithBannerSource:(NinaBannerSource)bannerSource WithBannerArray:(NSArray *)bannerArray {
    
    if (self = [super initWithFrame:frame]) {
        
        SELFWIDTH = frame.size.width;
        SELFHEIGHT = frame.size.height;
        totalNumber = bannerArray.count;
        currentPage = 1;
        isScrollHori = 1;
        [self addSubview:self.ninaScrollView];
        
        if (cycleStyle == 0) {
            NSLog(@"水平");
            _ninaScrollView.contentSize = CGSizeMake(SELFWIDTH * (totalNumber + 2), 0);
            _ninaScrollView.contentOffset = CGPointMake(SELFWIDTH, 0);
            _ninaScrollView.showsHorizontalScrollIndicator = NO;
            _ninaScrollView.alwaysBounceHorizontal = YES;
            isScrollHori = 2;
        }
        if (cycleStyle == 1) {
            NSLog(@"垂直");
            _ninaScrollView.contentSize = CGSizeMake(0, SELFHEIGHT * (totalNumber + 2));
            _ninaScrollView.contentOffset = CGPointMake(0,SELFHEIGHT);
            _ninaScrollView.showsVerticalScrollIndicator = NO;
            _ninaScrollView.alwaysBounceVertical = YES;
            _ninaScrollView.delaysContentTouches = NO;
            isScrollHori = 3;
        }
        if (bannerSource == 0) {
            NSLog(@"本地啦");
        }
        if (bannerSource == 1) {
            NSLog(@"网络啦");
        }        
        [self createBannerView:bannerArray WithCycle:cycleStyle WithBannerSource:bannerSource];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
    return self;
}

- (void)createBannerView:(NSArray *)bannerDetail WithCycle:(NSInteger)cycleNum WithBannerSource:(NSInteger)bannerSource {
    
    if (cycleNum == 0) {
        for (NSInteger i = 0; i < (totalNumber + 2); i++) {
            UIImageView *bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SELFWIDTH, 0, SELFWIDTH, SELFHEIGHT)];
            bannerImageView.tag = i;
            bannerImageView.userInteractionEnabled = YES;
            if (i == 0) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[totalNumber - 1]]];
                }
            }else if (i == totalNumber + 1) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[0]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[0]]];
                }
            }else {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[i - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[i - 1]]];
                }
            }
            [self.ninaScrollView addSubview:bannerImageView];
        }
        self.pageControl.currentPage = 0;
        myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:myTimer forMode:NSDefaultRunLoopMode];
    }
    if (cycleNum == 1) {
        for (NSInteger i = 0; i < (totalNumber + 2); i++) {
            UIImageView *bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, i * SELFHEIGHT, SELFWIDTH, SELFHEIGHT)];
            bannerImageView.tag = i;
            bannerImageView.userInteractionEnabled = YES;
            if (i == 0) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[totalNumber - 1]]];
                }
            }else if (i == totalNumber + 1) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[0]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[0]]];
                }
            }else {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[i - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[i - 1]]];
                }
            }
            [self.ninaScrollView addSubview:bannerImageView];
        }
        myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:myTimer forMode:NSDefaultRunLoopMode];
    }
}

#pragma mark - SetMethod
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    if (isScrollHori == 2) {
        self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
    }
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    if (isScrollHori == 2) {
        self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    }    
}
- (void)setBannerUrlArray:(NSArray *)bannerUrlArray {
    _bannerUrlArray = bannerUrlArray;
}
- (void)setShowPageControl:(BOOL)showPageControl {
    if (showPageControl == YES) {
        [self addSubview:self.pageControl];
    }
}

#pragma mark - GetMethod
- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = totalNumber;
        CGSize size = [_pageControl sizeForNumberOfPages:totalNumber];
        _pageControl.frame = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.center.x, SELFHEIGHT - size.height / 2);
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.hidesForSinglePage = YES;
//        [self addSubview:_pageControl];
    }
    return _pageControl;
}

- (UIScrollView *)ninaScrollView {
    
    if (!_ninaScrollView) {
        _ninaScrollView = [UIScrollView new];
        /**<  如果使用者没有设置这些属性,默认属性   **/
        _ninaScrollView.backgroundColor = [UIColor whiteColor];
        _ninaScrollView.frame = self.frame;
        _ninaScrollView.userInteractionEnabled = YES;
        _ninaScrollView.pagingEnabled = YES;
        _ninaScrollView.delegate = self;
        _ninaScrollView.bounces = NO; /**<  这个很重要！   **/
    }
    return _ninaScrollView;
}

#pragma mark - BtnAction
- (void)scrollAction {
    if (currentPage % (totalNumber + 1) != 0 || currentPage == 1) {
        if (isScrollHori == 2) {
            [self.ninaScrollView setContentOffset:CGPointMake(SELFWIDTH * (currentPage + 1), 0) animated:YES];
        }else if (isScrollHori == 3) {
            [self.ninaScrollView setContentOffset:CGPointMake(0, SELFHEIGHT * (currentPage + 1)) animated:YES];
        }
    }else if (currentPage % (totalNumber + 1) == 0 && currentPage != 1) {
        if (isScrollHori == 2) {
            [self.ninaScrollView setContentOffset:CGPointMake(SELFWIDTH, 0) animated:YES];
        }else if (isScrollHori == 3) {
            [self.ninaScrollView setContentOffset:CGPointMake(0, SELFHEIGHT) animated:YES];
        }
    }
}

- (void)scrollHoriAction {
    
    if (currentPage % (totalNumber + 1) != 0 || currentPage == 1) {
        [self.ninaScrollView setContentOffset:CGPointMake(SELFWIDTH * (currentPage + 1), 0) animated:YES];
    }
    else if (currentPage % (totalNumber + 1) == 0 && currentPage != 1) {
        [self.ninaScrollView setContentOffset:CGPointMake(SELFWIDTH, 0) animated:YES];
    }
}

- (void)scrollVertiAction {
    
    if (currentPage % (totalNumber + 1) != 0 || currentPage == 1) {
        [self.ninaScrollView setContentOffset:CGPointMake(0, SELFHEIGHT * (currentPage + 1)) animated:YES];
    }
    else if (currentPage % (totalNumber + 1) == 0 && currentPage != 1) {
        [self.ninaScrollView setContentOffset:CGPointMake(0, SELFHEIGHT) animated:YES];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (isScrollHori == 2) {
        currentPage = (NSInteger)((scrollView.contentOffset.x) / SELFWIDTH);
        self.pageControl.currentPage = currentPage - 1;
        CGFloat yourPage = (CGFloat)(scrollView.contentOffset.x) / SELFWIDTH;
        if (yourPage == (totalNumber + 1)) {
            [scrollView setContentOffset:CGPointMake(SELFWIDTH, 0) animated:NO];
        }
        if (yourPage == 0) {
            [scrollView setContentOffset:CGPointMake(totalNumber * SELFWIDTH, 0) animated:NO];
        }
    }else if (isScrollHori == 3){
        currentPage = (NSInteger)((scrollView.contentOffset.y) / SELFHEIGHT);
        CGFloat horiPage = (scrollView.contentOffset.y) / SELFHEIGHT;
        if (horiPage == totalNumber + 1) {
            [scrollView setContentOffset:CGPointMake(0, SELFHEIGHT) animated:NO];
        }
        if (horiPage == 0) {
            [scrollView setContentOffset:CGPointMake(0, totalNumber * SELFHEIGHT) animated:NO];
        }
    }    
    for (NSInteger i = 1; i < (totalNumber + 2); i++) {
        if (isScrollHori == 2) {
            if (scrollView.contentOffset.x == i * SELFWIDTH) {
                [yourTimer invalidate];
                [myTimer invalidate];
                yourTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollAction) userInfo:nil repeats:NO];
                [[NSRunLoop currentRunLoop] addTimer:yourTimer forMode:NSDefaultRunLoopMode];
            }
        }else if (isScrollHori == 3){
            if (scrollView.contentOffset.y == i * SELFHEIGHT) {
                [yourTimer invalidate];
                [myTimer invalidate];
                yourTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollAction) userInfo:nil repeats:NO];
                [[NSRunLoop currentRunLoop] addTimer:yourTimer forMode:NSDefaultRunLoopMode];
            }
        }
    }
}

#pragma mark - TapAction
- (void)tapAction {
    
    NSLog(@"触摸了");
}

@end
