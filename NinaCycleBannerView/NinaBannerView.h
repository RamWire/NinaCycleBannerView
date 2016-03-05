//
//  NinaBannerView.h
//  NinaCycleBannerView
//
//  Created by RamWire on 16/2/26.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NinaCycleStyle) {
    NinaCycleStyleHorizontal = 0,
    NinaCycleStyleVertical = 1,
};

typedef NS_ENUM(NSInteger, NinaBannerSource) {
    NinaBannerStyleOnlyLocalSource = 0,
    NinaBannerStyleOnlyWebSource = 1,
    NinaBannerStyleOnlyTextSource = 2,
};

@interface NinaBannerView : UIView<UIScrollViewDelegate>

- (instancetype)initWithFrame:(CGRect)frame WithCycleStyle:(NinaCycleStyle)cycleStyle WithBannerSource:(NinaBannerSource)bannerSource WithBannerArray:(NSArray *)bannerArray;

@property (nonatomic, strong) NSArray *bannerUrlArray; /**<  图片/文字数据   **/
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor; /**<  当前页点的颜色   **/
@property (nonatomic, strong) UIColor *pageIndicatorTintColor; /**<  未选中点的颜色   **/
@property (nonatomic, assign) BOOL showPageControl; /**<  是否要显示pagecontrol   **/
@property (nonatomic, assign) CGFloat timeInterval; /**<  滑动间隔   **/
@property (nonatomic, strong) NSArray *summaryArray; /**<  图片上的标题概要   **/

@end
