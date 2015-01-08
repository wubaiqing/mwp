/**
 * MWP 程序更新接口
 *
 * ``` Cordova - Javascript
 * window.MWP.update();
 * ```
 *
 * author wubaiqing <wubaiqing@vip.qq.com> 2014-12-23 10:21
 */

// nodejs - 执行Objective-C模块
var exec = require('cordova/exec');

// 初始化MWP类
var MWP = function() {};

// 调用Objective-C -> CDVMWPUpdate.m -> update方法
MWP.update = function(url) {
    exec(null, null, "CDVMWPUpdate", "update", [url]);
};

// 导入扩展
module.exports = MWP;
