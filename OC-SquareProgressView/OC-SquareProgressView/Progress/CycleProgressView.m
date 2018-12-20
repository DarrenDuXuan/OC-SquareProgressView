//
//  CycleProgressView.m
//  OC-SquareProgressView
//
//  Created by darren on 2018/12/20.
//  Copyright © 2018 杜璇. All rights reserved.
//

#import "CycleProgressView.h"

@interface CycleProgressView(){
    CGFloat _lineWidth;
    UIColor *_bgStrokeColor;
    UIColor *_progressStrokeColor;
    
    CGFloat _progress;
}


@property (strong, nonatomic) UIBezierPath *circlePath;

@property (strong, nonatomic) CAShapeLayer *bgLayer;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation CycleProgressView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initAction];
        [self initAll];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        [self initAction];
        [self initAll];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if ( self ) {
        [self initAction];
        [self initAll];
    }
    return self;
}

- (void)initAction{
    _lineWidth = 4;
    _bgStrokeColor = [UIColor colorWithWhite:1 alpha:0.5];
    _progressStrokeColor = [UIColor whiteColor];
}

- (void)initAll{
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    //贝塞尔曲线画圆弧
    self.circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:50 startAngle:-0.5 * M_PI endAngle:1.5*M_PI clockwise:YES];
    
    self.bgLayer = [CAShapeLayer layer];
    self.bgLayer.frame = self.bounds;
    self.bgLayer.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明色
    self.bgLayer.lineWidth = _lineWidth;
    self.bgLayer.strokeColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;//线条颜色
    self.bgLayer.strokeStart = 0;
    self.bgLayer.strokeEnd = 1;
    self.bgLayer.lineCap = kCALineCapRound;
    self.bgLayer.path = self.circlePath.CGPath;
    [self.layer addSublayer:self.bgLayer];
    
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.bounds;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = _lineWidth;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0.5;
    self.shapeLayer.path = self.circlePath.CGPath;
    [self.layer addSublayer:self.shapeLayer];
}

- (void)resetFrame{
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    self.circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, height / 2) radius:50 startAngle:-0.5 * M_PI endAngle:1.5*M_PI clockwise:YES];
    
    self.bgLayer.frame = self.bounds;
    self.bgLayer.path = self.circlePath.CGPath;
    
    self.shapeLayer.frame = self.bounds;
    self.shapeLayer.path = self.circlePath.CGPath;
}

- (void)setLineWidth:(CGFloat)lineWidth{
    if ( lineWidth < 0 ) {
        lineWidth = 0;
    }
    
    _lineWidth = lineWidth;
    self.bgLayer.lineWidth = lineWidth;
    self.shapeLayer.lineWidth = lineWidth;
}

- (void)setBgStrokeColor:(UIColor *)bgStrokeColor{
    _bgStrokeColor = bgStrokeColor;
    
    self.shapeLayer.strokeColor = bgStrokeColor.CGColor;
}

- (void)setProgressStrokeColor:(UIColor *)progressStrokeColor{
    _progressStrokeColor = progressStrokeColor;
    
    self.bgLayer.strokeColor = progressStrokeColor.CGColor;
}

- (void)setProgress:(CGFloat)progress{
    if ( isnan(progress) ) {
        return;
    }
    _progress = progress;
    
    self.shapeLayer.strokeEnd = progress;
    
}

@end
