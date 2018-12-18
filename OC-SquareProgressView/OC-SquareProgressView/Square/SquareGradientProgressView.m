//
//  SquareGradientProgressView.m
//  OC-SquareProgressView
//
//  Created by darren on 2018/12/17.
//  Copyright © 2018 杜璇. All rights reserved.
//

#import "SquareGradientProgressView.h"

@interface SquareGradientProgressView()

@property(nonatomic, strong) CAShapeLayer *foreLayer;

@property (nonatomic,strong) CALayer *gradientLayer;

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
    CAGradientLayer *contentLayer = [CAGradientLayer layer];
    contentLayer.frame = CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height);  // 分段设置渐变色
    contentLayer.colors = @[(id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    [self.gradientLayer addSublayer:contentLayer];
    
    [self.gradientLayer setMask:self.foreLayer];
}



- (void)updateProgress:(CGFloat)progress{
    if ( isnan(progress) ) {
        return;
    }
    [self.foreLayer setStrokeEnd:progress];;
}

@end
