//
//  UIColor+Hex.h
//  UIColor(Hex)
//
//  Created by 千锋 on 16/3/4.
//  Copyright (c) 2016年 UIT. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，  输入16进制的 颜色值 透明度 返回颜色
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
