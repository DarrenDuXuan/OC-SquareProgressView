//
//  ViewController.m
//  OC-SquareProgressView
//
//  Created by 杜璇 on 2018/3/19.
//  Copyright © 2018年 杜璇. All rights reserved.
//

#import "ViewController.h"
#import "XYSquareProgressView.h"
#import "SquareGradientProgressView.h"
#import "CycleProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet XYSquareProgressView *progressView;

@property (assign, nonatomic) CGFloat progress;

@property (weak, nonatomic) IBOutlet SquareGradientProgressView *sqGradientProgressView;

@property (weak, nonatomic) IBOutlet CycleProgressView *cycleProgressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.centerColor = [UIColor yellowColor];
    self.progressView.strokeColor = [UIColor redColor];
    self.progressView.width = 10;
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
    [self.sqGradientProgressView updateProgress:_progress];
}

- (IBAction)onClickSubProgressBtn:(id)sender {
    _progress -= 0.05;
    if ( _progress < 0.0 ) {
        _progress = 0.0;
    }
    self.progressView.percent = _progress;
    [self.sqGradientProgressView updateProgress:_progress];
}

@end
