# NinaCycleBannerView ![](http://cocoapod-badges.herokuapp.com/v/NinaCycleBannerView/badge.png) ![](http://cocoapod-badges.herokuapp.com/p/NinaCycleBannerView/badge.png)
* An easy way to use cycle banner view
* 几行代码搞定广告轮播图，横向纵向均可，用法简单，支持网络及本地图片轮播，并支持相关的图片点击事件。

## <a id="横向展示 Horizontal Scroll"></a> 横向展示 Horizontal Scroll
![(横向展示 Horizontal Scroll)](https://github.com/RamWire/NinaCycleBannerView/blob/master/Example/gifs/NinaCycleBannerView 3.gif) 
* 可以选择是否显示下方的pagecontrol，颜色可调节

## <a id="纵向展示 Vertical Scroll"></a> 纵向展示 Vertical Scroll
![纵向展示 Vertical Scroll](https://github.com/RamWire/NinaCycleBannerView/blob/master/Example/gifs/NinaCycleBannerView2.gif)
* 类似淘宝中间的轮播公告，以后会添加相关Label选项

## Install
- Download Zip from here,drag file '**NinaCycleBannerView**'to your project.
- [CocoaPods](https://cocoapods.org/)：
```
pod 'NinaCycleBannerView','~> 0.0.4' 
```
Before using Cocoapods,please `pod search NinaCycleBannerView`,if can't search it,please `pod setup`.

## Usage
You need add '**NinaCycleBanner.h**' to your project.
```objc
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
    /**<  图片上的标题概要   **/
    NSArray *summaryArray = @[
    @"第一张概要",
    @"第二张概要",
    @"第三张概要",
    @"第四张概要",
    @"第五张概要",
    @"第六张概要",
    @"第七张概要"
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
    /**<  文字通告轮播图的文字   **/
    NSArray *textLoopArray = @[
    @"第一张概要",
    @"第二张概要",
    @"第三张概要",
    @"第四张概要",
    @"第五张概要",
    @"第六张概要",
    @"第七张概要"
    ];
    NinaBannerView *bannerView = [[NinaBannerView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT / 8) WithCycleStyle:NinaCycleStyleHorizontal WithBannerSource:NinaBannerStyleOnlyLocalSource WithBannerArray:myLocalArray];
    [self.view addSubview:bannerView];
```
### Other Settings
```objc
    /**<  设置图片上的标题概要，如果不设置，默认不显示，此选项和是否显示pageControl在显示上可能会有冲突，所以在美观上面可能需要二者取一   **/
    bannerView.summaryArray = summaryArray;
    /**<  设置轮播图的滚动时间，如果不设置，默认为5秒   **/
    bannerView.timeInterval = 2.0;
    /**<  设置是否显示pageControl，如果不设置，默认不显示   **/
    bannerView.showPageControl = YES;
    /**<  如果是在Horizontal下，可以对pageControl的选中未选中颜色进行设置，如果不设置，默认current为白色，pageIndicatorTintColor为灰色   **/
    bannerView.currentPageIndicatorTintColor = [UIColor blackColor];
    bannerView.pageIndicatorTintColor = [UIColor yellowColor];
    /**<  如果有点击图片时间的需求，可以在这里传入数据，如果不设置，则不会push到下一级控制器即TapViewController(此控制器可以自定制)  **/
    bannerView.bannerUrlArray = urlArray;
```

## Opensource libraries used
- [SDWebImage](https://github.com/rs/SDWebImage)

## Licence

This project uses MIT License.
