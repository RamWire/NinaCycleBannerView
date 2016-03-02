//
//  TapViewController.m
//  NinaCycleBannerView
//
//  Created by RamWire on 16/3/1.
//  Copyright © 2016年 RamWire. All rights reserved.
//

#import "TapViewController.h"

//全屏宽和高大小
#define FUll_VIEW_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define FUll_VIEW_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //用url申请html显示在webView上
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT - 64)];
    
    NSURL *url = [NSURL URLWithString:_urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
