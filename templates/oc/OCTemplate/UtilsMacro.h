//
//  UtilsMacro.h
//
//
//  Created by ferrisxie on 2018/9/4.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h
#pragma mark - Property
#define windowRootViewController [[[UIApplication sharedApplication] delegate] window].rootViewController
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

// 操作系统版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
#define ScreenScale ([[UIScreen mainScreen] scale])
// 是否横竖屏
// 用户界面横屏了才会返回YES
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])
// 无论支不支持横屏，只要设备横屏了，就会返回YES
#define IS_DEVICE_LANDSCAPE UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])

// 状态栏高度(来电等情况下，状态栏高度会发生变化，所以应该实时计算)
#define StatusBarHeight (IOS_VERSION >= 8.0 ? ([[UIApplication sharedApplication] statusBarFrame].size.height) : (IS_LANDSCAPE ? ([[UIApplication sharedApplication] statusBarFrame].size.width) : ([[UIApplication sharedApplication] statusBarFrame].size.height)))
// 固定宽高，不受旋转影响
#define fixed_screen_width MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
#define fixed_screen_height MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)

//重新设定view的Y值
#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)
#define setFrameW(view, newW) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, newW, view.frame.size.height)

//取view的坐标及长宽
#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y

#pragma mark - Color
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define rgba(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define TABBAR_HEIGHT 49
#define BATTERY_HEIGHT (isiPhoneXSize ? 44 : 20)

#pragma mark - 内存
#ifndef weakify
#if __has_feature(objc_arc)

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#else

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")

#endif
#endif /* weakify */

#ifndef strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop") \
if(!self) return;
#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif /* strongify */

#pragma mark - Functions

#define FG_KEYWINDOW [UIApplication sharedApplication].keyWindow

#define LOGIN_PROTECTED     if(![FGUserCenter sharedInstance].isLogin){\
    [MBProgressHUD FG_showText:@"未登录"];\
    return;\
}

CG_INLINE CGPoint CGRectCenter(CGRect rect);

CG_INLINE CGPoint CGRectCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
//字符串
#define FtoS(floatNum) [NSString stringWithFormat:@"%f",floatNum]
#define MainFont   [UIFont fontWithName:@"PingFangSC-Regular" size:12]
#define MainFontWithSize(fontSize) [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize]
#define FontAttribute(color,fontSize) [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName,[MainFont fontWithSize:fontSize], NSFontAttributeName,nil]
#define Localize(key) NSLocalizedString(key, "")
#define QLog(s, ...)  NSLog(@"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
__LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#pragma mark - iPhoneX
#define BOOL_NOT_FOUND NSNotFound
#define isiPhoneXSize fixed_screen_height == 812.0f
#define NAVBAR_HEIGHT  (44 + (isiPhoneXSize ? 44 : 20))   //每日头条红色背景高度 含状态条


#define TransfromObjToClass(__obj,__class,__output)  \
__class * __output = nil;\
if([__obj isKindOfClass:[__class class]]){\
__output = (__class*)__obj;\
}else{\
NSLog(@"强制转换失败%@",[__class class]);\
NSAssert(NO, @"强制转换失败！！！！！！");\
return;\
}
#pragma mark - 事件
#define AS_EVENT_DISPACTER @property (nonatomic, strong) void(^onActionInvoke)(FGEventType event,id sender,NSDictionary* uInfo);\
@property (nonatomic, weak) id<FGCommonEventDelegate> eventDelegate;\
-(void)notifiEvent:(FGEventType)event withSender:(nullable id)sender withUserInfo:(NSDictionary *)uInfo;
#define DEF_EVENT_DISPACTER -(void)notifiEvent:(FGEventType)event withSender:(id )sender withUserInfo:(NSDictionary *)uInfo{\
    if(self.onActionInvoke){\
        self.onActionInvoke(event, sender, uInfo);\
    }\
    if(self.eventDelegate && [self.eventDelegate respondsToSelector:@selector(sender:didInvokeEvent:withUserInfo:)]){\
        [self.eventDelegate sender:sender didInvokeEvent:event withUserInfo:uInfo];\
    }\
}
#endif /* UtilsMacro_h */

