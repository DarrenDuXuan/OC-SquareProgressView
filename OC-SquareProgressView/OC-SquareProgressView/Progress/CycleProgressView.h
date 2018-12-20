//
//  CycleProgressView.h
//  OC-SquareProgressView
//
//  Created by darren on 2018/12/20.
//  Copyright © 2018 杜璇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CycleProgressView : UIView

- (void)resetFrame;

@property (assign, nonatomic) CGFloat lineWidth;

@property (strong, nonatomic) UIColor *bgStrokeColor;

@property (strong, nonatomic) UIColor *progressStrokeColor;

@property (assign, nonatomic) CGFloat progress;

@end

NS_ASSUME_NONNULL_END
