//
//  unlockLabel.h
//  LayerTest
//
//  Created by Yongjia Liu on 4/17/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
@interface unlockLabel : UILabel

@property(nonatomic) CGFloat animationDuration;
@property(nonatomic) CGFloat gradientWidth;
@property(nonatomic,strong) UIColor *tint;

-(void)startAnimation;
//-(void)stopAnimation;
@end
