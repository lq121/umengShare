//
//  ViewController.m
//  umengDemo
//
//  Created by v大夫 on 15/12/31.
//  Copyright © 2015年 LQ. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"

@interface ViewController ()<UMSocialUIDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // appkey 	5628dc19e0f55a9e0d000173
    //    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(30, 30, 30, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickBtn
{
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44);
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(44, 0, 60, 44);
    [btn setTitle:@"分享到微博" forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"UMS_sina_icon@2x.png"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"UMS_sina_on@2x.png"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"UMS_sina_icon@2x.png"] forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn addTarget:self action:@selector(clickRedBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    
//    if ([[WEAK_IMPORT_ATTRIBUTE isQQInstalled]
//        isWXAppInstalled]) {
//        
//    }
//    
    UIButton *btn2 = [[UIButton alloc]init];
    [btn2 setTitle:@"分享到微信好友" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(120, 0, 60, 44);
    btn2.backgroundColor = [UIColor redColor];
    [view addSubview:btn2];
    [btn2 addTarget:self action:@selector(clickRedBtn2) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [[UIButton alloc]init];
    [btn3 setTitle:@"分享到微信朋友圈" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(190, 0, 60, 44);
    btn3.backgroundColor = [UIColor redColor];
    [view addSubview:btn3];
    [btn3 addTarget:self action:@selector(clickRedBtn3) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 友盟本身自带的。
//    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
//    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
//    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"V大夫";
//    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:@"53290df956240b6b4a0084b3"
//                                      shareText:@"V大夫预约儿科名医"
//                                     shareImage:[UIImage imageNamed:@"120.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,nil]
//                                       delegate:self];
}

- (void)clickRedBtn
{
    [[UMSocialControllerService defaultControllerService] setShareText:@"分享文本" shareImage:[UIImage imageNamed:@"120.png"] socialUIDelegate:self];
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

- (void)clickRedBtn2
{
        [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
        [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
        [UMSocialData defaultData].extConfig.wechatSessionData.title = @"V大夫";
        [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
    [[UMSocialControllerService defaultControllerService] setShareText:@"分享文本" shareImage:[UIImage imageNamed:@"120.png"] socialUIDelegate:self];
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

- (void)clickRedBtn3
{
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"V大夫";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
    [[UMSocialControllerService defaultControllerService] setShareText:@"分享文本" shareImage:[UIImage imageNamed:@"120.png"] socialUIDelegate:self];
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatTimeline].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}


//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
