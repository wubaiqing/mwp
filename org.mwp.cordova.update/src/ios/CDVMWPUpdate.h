/**
 * MWP手机应用程序更新扩展
 *
 * ``` Javascript
 * window.MWP.update()
 * ```
 *
 * author wubaiqing <wubaiqing@vip.qq.com> 2014-12-23 15:37
 */

#import <Cordova/CDVPlugin.h>

@interface CDVMWPUpdate : CDVPlugin

# pragma mark MWP程序更新
- (void)update:(CDVInvokedUrlCommand*)command;

@end
