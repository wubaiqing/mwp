/**
 * MWP手机应用程序更新扩展
 *
 * ``` Javascript
 * window.MWP.update()
 * ```
 *
 * author wubaiqing <wubaiqing@vip.qq.com> 2014-12-23 15:37
 */

#import "CDVMWPUpdate.h"
#import <Cordova/CDV.h>

@implementation CDVMWPUpdate

# pragma mark MWP程序更新
- (void)update:(CDVInvokedUrlCommand*)command
{
    // 非模拟器下执行请求
    if (TARGET_IPHONE_SIMULATOR == 0) {
        NSURL *url = [[NSURL alloc] initWithString:@"itms-services://?action=download-manifest&url=https://dn-cloudmwp.qbox.me/MWP.plist"];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
