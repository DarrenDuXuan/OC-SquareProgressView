//
//  UIColor+Translate.m
//  OC-SquareProgressView
//
//  Created by 杜璇 on 2018/3/19.
//  Copyright © 2018年 杜璇. All rights reserved.
//

#import "UIColor+Translate.h"

@implementation UIColor (Translate)

#pragma mark - color with hex
+ (UIColor *) xycColorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alphaValue];
}

+ (UIColor *) xycColorWithHex:(NSInteger)hexValue
{
    return [UIColor xycColorWithHex:hexValue alpha:1.0];
}

+ (NSUInteger)xycHexFromColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    NSString *hexString = [NSString stringWithFormat:@"0xFF%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
    
    unsigned long result = strtoul([hexString UTF8String], 0, 16);
    
    return result;
}

@end
