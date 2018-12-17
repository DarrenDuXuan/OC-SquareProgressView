//
//  ViewController.m
//  OC-SquareProgressView
//
//  Created by 杜璇 on 2018/3/19.
//  Copyright © 2018年 杜璇. All rights reserved.
//

#import "ViewController.h"
#import "XYSquareProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet XYSquareProgressView *progressView;

@property (assign, nonatomic) CGFloat progress;

@property(nonatomic, strong) CAShapeLayer *foreLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.centerColor = [UIColor yellowColor];
    self.progressView.strokeColor = [UIColor redColor];
    self.progressView.width = 10;
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
    self.foreLayer = [CAShapeLayer new];
    self.foreLayer.path = path.CGPath;
    self.foreLayer.fillColor = [UIColor clearColor].CGColor;
    self.foreLayer.strokeColor = [UIColor blackColor].CGColor;
    self.foreLayer.lineWidth = 4;
    self.foreLayer.strokeStart = 0;
    self.foreLayer.strokeEnd = 0;
    [self.view.layer addSublayer:self.foreLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickAddProgressBtn:(id)sender {
    _progress += 0.05;
    if ( _progress > 1.0 ) {
        _progress = 1.0;
    }
    self.progressView.percent = _progress;
    self.foreLayer.strokeEnd = _progress;
}

- (IBAction)onClickSubProgressBtn:(id)sender {
    _progress -= 0.05;
    if ( _progress < 0.0 ) {
        _progress = 0.0;
    }
    self.progressView.percent = _progress;
    self.foreLayer.strokeEnd = _progress;
}

@end
