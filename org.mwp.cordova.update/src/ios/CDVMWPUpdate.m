/**
 * MWP手机应用程序更新扩展
 *
 * ``` Javascript
 * window.MWP.update()
 * ```
 *
 * author wubaiqing <wubaiqing@vip.qq.com> 2014-12-23 15:37
 */

#import <UIKit/UIKit.h>
#import "CDVMWPUpdate.h"
#import <Cordova/CDV.h>

@implementation CDVMWPUpdate
{
    NSDictionary *dic;
}

# pragma mark MWP程序更新
- (void)update:(CDVInvokedUrlCommand*)command
{
    if (TARGET_IPHONE_SIMULATOR == 1) {
        return ;
    }

    NSString *url = [command.arguments objectAtIndex:0];

    // 设置网络请求时间
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    [request setTimeoutInterval:60];

    // 请求网络，得到JSON字符串
    NSURLResponse *response;
    NSData *requestData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    dic = [NSJSONSerialization JSONObjectWithData:requestData options:NSJSONReadingAllowFragments error:nil];

    // 获取软件版本信息
    NSDictionary *appInfoDic = NSBundle.mainBundle.infoDictionary;
    NSString *version = appInfoDic[@"CFBundleShortVersionString"];

    // 判断版本号是否移植
    if ([version isEqualToString:dic[@"verName"]] == NO) {
        // 提示更新
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"软件有新的版本更新" delegate:self cancelButtonTitle:@"更新" otherButtonTitles:@"取消", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // 非模拟器下执行请求
        NSURL *url = [[NSURL alloc] initWithString:dic[@"ipaPath"]];
        [[UIApplication sharedApplication] openURL:url];
        
    }
}

@end