//
//  XYCrawerVideoProgressView.m
//  XiaoYing
//
//  Created by 杜璇 on 2018/3/5.
//  Copyright © 2018年 XiaoYing. All rights reserved.
//

#import "XYSquareProgressView.h"
#import "UIColor+Translate.h"

@implementation XYSquareProgressView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if ( self )  {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if ( self ) {
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initUI];
}

- (void) initUI{
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1.0;
    self.width = 4;
}

- (void)setPercent:(float)percent{
    if ( isnan(percent) ) {
        return;
    }
    _percent = percent;
    [self setNeedsDisplay];
}

- (void)setNeedsDisplay{
    [super setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self drawCenterView];
    [self drawLineView];
}

- (void) drawLineView{
    float progressW = self.frame.size.width;
    float progressH = self.frame.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextSetLineWidth(context, _width);
    CGContextSetStrokeColorWithColor(context, _strokeColor == nil?[UIColor blackColor].CGColor:_strokeColor.CGColor);
    // 255, 84, 19
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0);
    if ( _percent <= 0.25 ) {
        float pWidth = (progressW*_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, progressW, 0);
        float pPointY = progressH*(_percent - 0.25)/0.25;
        CGContextAddLineToPoint(context, progressW, pPointY);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, progressW, 0);
        CGContextAddLineToPoint(context, progressW, progressH);
        float pWidth = progressW*(0.75-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, progressH);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, progressW, 0);
        CGContextAddLineToPoint(context, progressW, progressH);
        CGContextAddLineToPoint(context, 0, progressH);
        float pPointY = progressH*(1-_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pPointY);
    }else{
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, progressW, 0);
        CGContextAddLineToPoint(context, progressW, progressH);
        CGContextAddLineToPoint(context, 0, progressH);
    }
    CGContextStrokePath(context);
}

- (void) drawCenterView{
    float W = self.frame.size.width;
    float H = self.frame.size.height;
    CGRect rect2 = CGRectMake(0, 0, W, H);
    [_centerColor==nil?[UIColor greenColor]:_centerColor set];
    UIRectFill(rect2);
}

@end
