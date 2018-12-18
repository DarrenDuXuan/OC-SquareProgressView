//
//  SquareGradientProgressView.m
//  OC-SquareProgressView
//
//  Created by darren on 2018/12/17.
//  Copyright © 2018 杜璇. All rights reserved.
//

#import "SquareGradientProgressView.h"
#import "UIColor+Translate.h"

@interface SquareGradientProgressView(){
    CGFloat _lineWidth;
}

//
@property(nonatomic, strong) CAShapeLayer *foreLayer;

@property (nonatomic,strong) CALayer *gradientLayer;

@property (nonatomic, strong) CAGradientLayer *contentLayer;

@end

@implementation SquareGradientProgressView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initAll];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (  self == [super initWithCoder:aDecoder] ) {
        [self initAll];
    }
    return self;
}

- (void)initAll{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    self.foreLayer = [CAShapeLayer new];
    self.foreLayer.path = path.CGPath;
    self.foreLayer.fillColor = [UIColor clearColor].CGColor;
    self.foreLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.foreLayer.lineWidth = 4;
    self.foreLayer.strokeStart = 0;
    self.foreLayer.strokeEnd = 0;
    [self.layer addSublayer:self.foreLayer];
    
    self.gradientLayer = [CALayer layer];
    self.gradientLayer.frame = self.bounds;
    [self.layer addSublayer:self.gradientLayer];
    
    //渐变色
    self.contentLayer = [CAGradientLayer layer];
    self.contentLayer.frame = CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height);  // 分段设置渐变色
    self.contentLayer.colors = @[(id)[UIColor colorWithRed:255.0/255 green:74.0/255 blue:0 alpha:1].CGColor, (id)[UIColor colorWithRed:247.0/255 green:102.0/255 blue:28.0/255 alpha:1].CGColor];
    [self.gradientLayer addSublayer:self.contentLayer];
    
    [self.gradientLayer setMask:self.foreLayer];
}

- (void)setLineWidth:(CGFloat)lineWidth{
    if ( lineWidth < 0 ) {
        lineWidth = 0;
    }
    _lineWidth = lineWidth;
    self.foreLayer.lineWidth = _lineWidth;
}

- (void)setColors:(NSArray<UIColor *> *)colors{
    if ( colors.count == 0 ) {
        return;
    }
    NSMutableArray *array = [NSMutableArray array];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:(__bridge id)obj.CGColor];
    }];
    
    self.contentLayer.colors = [array copy];
}

- (void)updateProgress:(CGFloat)progress{
    if ( isnan(progress) ) {
        return;
    }
    [self.foreLayer setStrokeEnd:progress];;
}

@end
