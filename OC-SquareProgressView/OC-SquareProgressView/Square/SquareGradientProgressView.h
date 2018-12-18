//
//  SquareGradientProgressView.h
//  OC-SquareProgressView
//
//  Created by darren on 2018/12/17.
//  Copyright © 2018 杜璇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SquareGradientProgressView : UIView

@property (assign, nonatomic) CGFloat lineWidth;

@property (strong, nonatomic) NSArray <UIColor *> *colors;



- (void)updateProgress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
