# umengShare
#根据友盟的api编写的关于用友盟进行的第三方分享的demo
## 使用步骤
* 1.先在友盟中注册一个移动应用获取appkey 然后下载sdk 此时的sdk可以根据你的要分享的平台而进行打包。你可以在下载的时候选择要分享的平台。
* 2.导入sdk 根据API分析要对info.plist进行配置。引入需要的包
* 3.在info 中的url types 中添加瑶分享到的平台的urlschemes
* 4. 在appdelegate中去注册
*[UMSocialData openLog:YES];
*[UMSocialData setAppKey:@"5******"];
*[UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3*****"RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
*[UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
*[UMSocialWechatHandler setWXAppId:@"wx5********" appSecret:@"09***************" url:@"http://www.umeng.com/social"];
* 5.在友盟的分享中有使用友盟自带的界面布局也有自己编写界面重写方法
*[[UMSocialControllerService defaultControllerService] setShareText:@"分享文本" shareImage:[UIImage imageNamed:@"120.png"]socialUIDelegate:self];
*[UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession].snsClickHandler(self,[UMSocialControllerServicedefaultControllerService],YES);
#
