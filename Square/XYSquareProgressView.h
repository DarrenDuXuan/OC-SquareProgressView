//
//  XYCrawerVideoProgressView.h
//  XiaoYing
//
//  Created by 杜璇 on 2018/3/5.
//  Copyright © 2018年 XiaoYing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SquareStartPoint) {
    SquareStartPointLeftUp     = 0,
    SquareStartPointRightUp    = 1,
    SquareStartPointRightDown  = 2,
    SquareStartPointLeftDown   = 3,
};

typedef NS_ENUM(NSInteger, SquareDirection) {
    SquareDirectionRight = 0,
    SquareDirectionLeft  = 1,
};

@interface XYSquareProgressView : UIView

@property (assign, nonatomic)float percent;

//line width
@property (assign, nonatomic)float width;//normal = 4

//color
@property (strong, nonatomic) UIColor *strokeColor;

@property (strong, nonatomic) UIColor *centerColor;

@end
