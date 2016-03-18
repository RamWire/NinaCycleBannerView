//
//  NinaBannerView.m
//  NinaCycleBannerView
//
//  Created by RamWire on 16/2/26.
//  Copyright © 2016年 RamWire. All rights reserved.
//
#import "NinaBannerView.h"
#import "UIView+ViewController.h"
#import "TapViewController.h"
#import "UIImageView+WebCache.h"

@interface NinaBannerView ()
@property (nonatomic, strong) UIPageControl *pageControl; /**<  下方显示页数   **/
@property (nonatomic, strong) UIScrollView *ninaScrollView; /**<  轮播图   **/
@property (nonatomic, strong) NSTimer *myTimer; /**<  定时器   **/
@end
//全屏宽和高大小
#define FUll_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation NinaBannerView {
    CGFloat SELFWIDTH;
    CGFloat SELFHEIGHT;
    NSInteger totalNumber;
    NSInteger currentPage;
    NSInteger isScrollHori;
    NSMutableArray *bannerImageArray;
}

- (instancetype)initWithFrame:(CGRect)frame WithCycleStyle:(NinaCycleStyle)cycleStyle WithBannerSource:(NinaBannerSource)bannerSource WithBannerArray:(NSArray *)bannerArray {
    
    if (self = [super initWithFrame:frame]) {
        SELFWIDTH = frame.size.width;
        SELFHEIGHT = frame.size.height;
        totalNumber = bannerArray.count;
        currentPage = 1;
        isScrollHori = 1;
        bannerImageArray = [NSMutableArray array];
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
            bannerImageView.backgroundColor = [UIColor whiteColor];
            UILabel *loopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SELFWIDTH, SELFHEIGHT)];
            loopLabel.textColor = [UIColor brownColor];
            loopLabel.textAlignment = NSTextAlignmentCenter;
            loopLabel.font = [UIFont systemFontOfSize:12];
            [bannerImageView addSubview:loopLabel];
            if (i == 0) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[totalNumber - 1];
                }
            }else if (i == totalNumber + 1) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[0]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[0]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[0];
                }
            }else {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[i - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[i - 1]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[i - 1];
                }
            }
            [bannerImageArray addObject:bannerImageView];
            [self.ninaScrollView addSubview:bannerImageView];
        }
        self.pageControl.currentPage = 0;
    }
    if (cycleNum == 1) {
        for (NSInteger i = 0; i < (totalNumber + 2); i++) {
            UIImageView *bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, i * SELFHEIGHT, SELFWIDTH, SELFHEIGHT)];
            bannerImageView.tag = i;
            bannerImageView.userInteractionEnabled = YES;
            bannerImageView.backgroundColor = [UIColor whiteColor];
            UILabel *loopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SELFWIDTH, SELFHEIGHT)];
            loopLabel.textColor = [UIColor brownColor];
            loopLabel.textAlignment = NSTextAlignmentCenter;
            loopLabel.font = [UIFont systemFontOfSize:14];
            loopLabel.userInteractionEnabled = YES;
            [bannerImageView addSubview:loopLabel];
            if (i == 0) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[totalNumber - 1]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[totalNumber - 1];
                }
            }else if (i == totalNumber + 1) {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[0]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[0]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[0];
                }
            }else {
                if (bannerSource == 0) {
                    bannerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bannerDetail[i - 1]]];
                }else if (bannerSource == 1) {
                    [bannerImageView sd_setImageWithURL:[NSURL URLWithString:bannerDetail[i - 1]]];
                }else if (bannerSource == 2) {
                    loopLabel.text = bannerDetail[i - 1];
                }
            }
            [bannerImageArray addObject:bannerImageView];
            [self.ninaScrollView addSubview:bannerImageView];
        }
    }
    if (totalNumber > 1) {
        [self setupTimer:5.0];
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
    if (showPageControl == YES && isScrollHori == 2) {
        [self addSubview:self.pageControl];
    }
}
- (void)setTimeInterval:(CGFloat)timeInterval {
    _timeInterval = timeInterval;
    if (self.myTimer && totalNumber > 1) {
        [self.myTimer invalidate];
        [self setupTimer:_timeInterval];
    }
}
- (void)setSummaryArray:(NSArray *)summaryArray {
    _summaryArray = summaryArray;
    for (NSInteger i = 0; i < (totalNumber + 2); i++) {
        UIImageView *backGroundView = (UIImageView *)bannerImageArray[i];
        UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, SELFHEIGHT - 30.0, SELFWIDTH, 30.0)];
        titleView.backgroundColor = [UIColor blackColor];
        titleView.alpha = 0.5;
        [backGroundView addSubview:titleView];
        //在视图上加入标题
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 2.5, SELFWIDTH - 30.0, 25.0)];
        label.textColor = [UIColor greenColor];
        if (i == 0) {
            label.text = _summaryArray[totalNumber - 1];
        }else if (i == totalNumber + 1) {
            label.text = _summaryArray[0];
        }else {
            label.text = _summaryArray[i - 1];
        }
        [titleView addSubview:label];
    }
}

#pragma mark - LazyLoad
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
    }
    return _pageControl;
}

- (UIScrollView *)ninaScrollView {
    
    if (!_ninaScrollView) {
        _ninaScrollView = [UIScrollView new];
        /**<  如果使用者没有设置这些属性,默认属性   **/
        _ninaScrollView.backgroundColor = [UIColor whiteColor];
        _ninaScrollView.frame = CGRectMake(0, 0, SELFWIDTH, SELFHEIGHT);
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
        /**<  存在的问题，需要进行加1才能使scrollview loop起来，可能存在误差   **/
        currentPage = (NSInteger)((scrollView.contentOffset.y + 1) / SELFHEIGHT);
        CGFloat horiPage = (scrollView.contentOffset.y) / SELFHEIGHT;
        if (horiPage == totalNumber + 1) {
            [scrollView setContentOffset:CGPointMake(0, SELFHEIGHT) animated:NO];
        }
        if (horiPage == 0) {
            [scrollView setContentOffset:CGPointMake(0, totalNumber * SELFHEIGHT) animated:NO];
        }
    }
}

/**
 *  监测到有拖动的动作时，暂停定时器。
 *
 *  @param scrollView 当前scrollView
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.myTimer && totalNumber > 1) {
        [self.myTimer invalidate];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.timeInterval > 0 && totalNumber > 1) {
        [self setupTimer:self.timeInterval];
    }else {
        if (totalNumber > 1) {
            [self setupTimer:5.0];
        }
    }
}

#pragma mark - TapAction
- (void)tapAction {
    NSLog(@"触摸了");
    if (_bannerUrlArray.count > 0) {
        TapViewController *tapVC = [TapViewController new];
        tapVC.urlStr = _bannerUrlArray[currentPage - 1];
        if (tapVC.urlStr.length > 0) {
            [self.viewController.navigationController pushViewController:tapVC animated:YES];
        }
    }
}

#pragma mark - SetupTimer
/**
 *  启动定时器
 *
 *  @param timeInterval 定时器的时间间隔
 */
- (void)setupTimer:(CGFloat)timeInterval {
    self.myTimer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(scrollAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSDefaultRunLoopMode];
}

@end
