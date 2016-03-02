# NinaCycleBannerView ![](http://cocoapod-badges.herokuapp.com/v/NinaCycleBannerView/badge.png) ![](http://cocoapod-badges.herokuapp.com/p/NinaCycleBannerView/badge.png)
* An easy way to use cycle banner view
* 几行代码搞定广告轮播图，横向纵向均可，用法简单，支持网络及本地图片轮播，并支持相关的图片点击事件。

## <a id="横向展示 Horizontal Scroll"></a> 横向展示 Horizontal Scroll
![(横向展示 Horizontal Scroll)](https://github.com/RamWire/NinaCycleBannerView/blob/master/Example/gifs/NinaCycleBannerView3.gif) 
* 可以选择是否显示下方的pagecontrol，颜色可调节

## <a id="纵向展示 Vertical Scroll"></a> 纵向展示 Vertical Scroll
![纵向展示 Vertical Scroll](https://github.com/RamWire/NinaCycleBannerView/blob/master/Example/gifs/NinaCycleBannerView2.gif)
* 类似淘宝中间的轮播公告，以后会添加相关Label选项

## Install
- Download Zip from here,drag file '**NinaCycleBannerView**'to your project.
- [CocoaPods](https://cocoapods.org/)：
```
pod 'NinaCycleBannerView','~> 0.0.2' 
```
Before using Cocoapods,please `pod search NinaCycleBannerView`,if can't search it,please `pod setup`.

## Usage
You need add '**NinaCycleBanner.h**' to your project.
```objc
    /**<  本地图片   **/
    NSArray *myLocalArray = @[
                         @"1",
                         @"2",
                         @"3",
                         @"4",
                         @"5",
                         @"6",
                         @"7"
                         ];
    /**<  网络图片   **/
    NSArray *myWebArray = @[
                         @"web1",
                         @"web2",
                         @"web3",
                         @"web4",
                         @"web5",
                         @"web6",
                         @"web7"
                         ];
    /**<  点击Url   **/
    NSArray *urlArray = @[
                          @"url1",
                          @"url2",
                          @"url3",
                          @"url4",
                          @"url5",
                          @"url6",
                          @"url7"
                          ];
    /**<  你只要将上述的网络或本地的数组传入一个即可   **/
    NinaBannerView *bannerView = [[NinaBannerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT / 2) WithCycleStyle:NinaCycleStyleHorizontal WithBannerSource:NinaBannerStyleOnlyWebSource WithBannerArray:myWebArray];
```
### Other Settings
```objc
    /**<  如果是在Horizontal下，可以选择是否需要显示pageControl   **/
    bannerView.showPageControl = YES;
    /**<  如果是在Horizontal下，可以对pageControl的选中未选中颜色进行设置   **/
    bannerView.currentPageIndicatorTintColor = [UIColor blackColor];
    bannerView.pageIndicatorTintColor = [UIColor yellowColor];
    /**<  如果有点击图片时间的需求，可以在这里传入数据   **/
    bannerView.bannerUrlArray = urlArray;    
    [self.view addSubview:bannerView];
```

## Opensource libraries used
- [SDWebImage](https://github.com/rs/SDWebImage)

## Licence

This project uses MIT License.
