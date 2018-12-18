//
//  UIColor+Translate.h
//  OC-SquareProgressView
//
//  Created by 杜璇 on 2018/3/19.
//  Copyright © 2018年 杜璇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Translate)

+ (UIColor *) xycColorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor *) xycColorWithHex:(NSInteger)hexValue;

+ (NSUInteger)xycHexFromColor:(UIColor *)color;

@end
