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
    float w = self.frame.size.width;
    float h = self.frame.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextSetLineWidth(context, _width);
    CGContextSetStrokeColorWithColor(context, _strokeColor == nil?[UIColor blackColor].CGColor:_strokeColor.CGColor);
    
    CGContextBeginPath(context);
    
    switch (_direction) {
        case SquareDirectionRight:
        {
            switch (_startPoint) {
                case SquareStartPointLeftUp:
                    [self updatePointLeftUpToRight:w progressH:h context:context];
                    break;
                case SquareStartPointRightUp:
                    [self updatePointRightUpToRight:w progressH:h context:context];
                    break;
                case SquareStartPointRightDown:
                    [self updatePointRightDownToRight:w progressH:h context:context];
                    break;
                case SquareStartPointLeftDown:
                    [self updatePointLeftDownToRight:w progressH:h context:context];
                    break;
                default:
                    break;
            }
        }
            break;
        case SquareDirectionLeft:
        {
            switch (_startPoint) {
                case SquareStartPointLeftUp:
                    [self updatePointLeftUpToLeft:w progressH:h context:context];
                    break;
                case SquareStartPointRightUp:
                    [self updatePointRightUpToLeft:w progressH:h context:context];
                    break;
                case SquareStartPointRightDown:
                    [self updatePointRightDownToLeft:w progressH:h context:context];
                    break;
                case SquareStartPointLeftDown:
                    [self updatePointLeftDownToLeft:w progressH:h context:context];
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    CGContextStrokePath(context);
}

//////////////////// Right Direction
#pragma mark - Point LeftUp To Right
- (void)updatePointLeftUpToRight:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, 0, 0);
    if ( _percent <= 0.25 ) {
        float pWidth = (w*_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, w, 0);
        float pHeight = h*(_percent - 0.25)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
        float pWidth = w*(0.75-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, 0, h);
        float pHeight = h*(1-_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else{
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
    }
}

#pragma mark - Point RightUp To Right
- (void)updatePointRightUpToRight:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, w, 0);
    if ( _percent <= 0.25 ) {
        float pHeight = (h*_percent)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, w, h);
        float pWidth = w*(0.5-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, 0, h);
        float pHeight = h*(0.75-_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
        float pWidth = w*(_percent-0.75)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else{
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
    }
}

#pragma mark - Point RightDown To Right
- (void)updatePointRightDownToRight:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, w, h);
    if ( _percent <= 0.25 ) {
        float pWidth = w*(0.25-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, 0, h);
        float pHeight = h*(0.5-_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
        float pWidth = w*(_percent-0.5)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
        float pHeight = h*(_percent-0.75)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else{
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
    }
}

#pragma mark - Point RightDown To Right
- (void)updatePointLeftDownToRight:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, 0, h);
    if ( _percent <= 0.25 ) {
        float pHeight = h*(0.25-_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, 0, 0);
        float pWidth = w*(_percent-0.25)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
        float pHeight = w*(_percent-0.5)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
        float pWidth = w*(1-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else{
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, w, h);
    }
}

//////////////////// Left Direation
#pragma mark - Point LeftUp To Left
- (void)updatePointLeftUpToLeft:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, 0, 0);
    if ( _percent <= 0.25 ) {
        float pHeight = h*(_percent)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, 0, h);
        float pWidth = w*(_percent-0.25)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
        float pHeight = h*(0.75-_percent)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
        float pWidth = w*(1-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else{
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
    }
}

#pragma mark - Point RightUp To Left
- (void)updatePointRightUpToLeft:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, w, 0);
    if ( _percent <= 0.25 ) {
        float pWidth = w*(0.25-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, 0, 0);
        float pHeight = h*(_percent-0.25)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
        float pWidth = w*(_percent-0.5)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
        float pHeight = h*(1-_percent)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else{
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
    }
}

#pragma mark - Point RightDown To Left
- (void)updatePointRightDownToLeft:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, w, h);
    if ( _percent <= 0.25 ) {
        float pHeight = h*(0.25-_percent)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, w, 0);
        float pWidth = w*(0.5-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
        float pHeight = h*(_percent-0.5)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
        float pWidth = w*(_percent-0.75)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else{
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
        CGContextAddLineToPoint(context, w, h);
    }
}

#pragma mark - Point RightDown To Left
- (void)updatePointLeftDownToLeft:(float)w progressH:(float)h context:(CGContextRef)context{
    CGContextMoveToPoint(context, 0, h);
    if ( _percent <= 0.25 ) {
        float pWidth = w*(_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, h);
    }else if ( _percent <= 0.5 ){
        CGContextAddLineToPoint(context, w, h);
        float pHeight = h*(0.5-_percent)/0.25;
        CGContextAddLineToPoint(context, w, pHeight);
    }else if ( _percent <= 0.75 ){
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
        float pWidth = w*(0.75-_percent)/0.25;
        CGContextAddLineToPoint(context, pWidth, 0);
    }else if ( _percent <= 1 ){
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
        float pHeight = h*(_percent-0.75)/0.25;
        CGContextAddLineToPoint(context, 0, pHeight);
    }else{
        CGContextAddLineToPoint(context, w, h);
        CGContextAddLineToPoint(context, w, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, h);
    }
}


#pragma mark - Point LeftUp To Left

- (void) drawCenterView{
    float W = self.frame.size.width;
    float H = self.frame.size.height;
    CGRect rect2 = CGRectMake(0, 0, W, H);
    [_centerColor==nil?[UIColor greenColor]:_centerColor set];
    UIRectFill(rect2);
}

@end
