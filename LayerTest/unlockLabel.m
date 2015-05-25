//
//  unlockLabel.m
//  LayerTest
//
//  Created by Yongjia Liu on 4/17/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "unlockLabel.h"

#define kGradientSize   0.45f
#define kAnimationDuration  2.25f
#define kGradientTint   [UIColor whiteColor]

#define kAnimationKey   @"gradientAnimation"
#define kGradientStartPointKey  @"startPoint"
#define kGradientEndPointKey    @"endPoint"

@interface unlockLabel()

@property(nonatomic,strong) CATextLayer *textLayer;

@end
@implementation unlockLabel

#pragma mark initialization

-(void)initializeLayers
{
    self.tint=kGradientTint;
    self.animationDuration=kAnimationDuration;
    self.gradientWidth=kGradientSize;
    UIColor *blue=[UIColor blueColor];
    UIColor *green=[UIColor greenColor];
    UIColor *red=[UIColor redColor];
    int value = arc4random() % 3;
    CAGradientLayer *gradientLayer=(CAGradientLayer *)self.layer;
    gradientLayer.backgroundColor=[super.textColor CGColor];
    gradientLayer.startPoint=CGPointMake(-self.gradientWidth, 0.);
    gradientLayer.endPoint=CGPointMake(0., 0.);
    //gradientLayer.colors=@[(id)[self.textColor CGColor],(id)[self.tint CGColor],(id)[self.textColor CGColor]];
    gradientLayer.colors=@[(id)[self.textColor CGColor],(id)[blue CGColor],(id)[green CGColor],(id)[red CGColor],(id)[self.textColor CGColor]];
    self.textLayer=[CATextLayer layer];
    self.textLayer.backgroundColor=[[UIColor clearColor] CGColor];
    self.textLayer.contentsScale=[[UIScreen mainScreen] scale];
    self.textLayer.rasterizationScale=[[UIScreen mainScreen] scale];
    self.textLayer.bounds=self.bounds;
    self.textLayer.anchorPoint=CGPointZero;
    [self setFont:          super.font];
    [self setTextAlignment: super.textAlignment];
    //[self setText:          super.text];
    //[self setTextColor:     super.textColor];
    
    gradientLayer.mask=self.textLayer;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLayers];// Initialization code
    }
    return self;
}

//- (UIColor *)textColor
//{
//    UIColor *textColor = [UIColor colorWithCGColor:self.layer.backgroundColor];
//    if (!textColor) {
//        textColor = [super textColor];
//    }
//    return textColor;
//}
//
//- (void)setTextColor:(UIColor *)textColor
//{
//    CAGradientLayer *gradientLayer  = (CAGradientLayer *)self.layer;
//    gradientLayer.backgroundColor   = [textColor CGColor];
//    gradientLayer.colors            = @[(id)[textColor CGColor],(id)[self.tint CGColor], (id)[textColor CGColor]];
//    
//    [self setNeedsDisplay];
//}

- (NSString *)text
{
    return self.textLayer.string;
}

- (void)setText:(NSString *)text
{
    self.textLayer.string = text;
    [self setNeedsDisplay];
}
-(void)startAnimation
{
    CAGradientLayer *gradientLayer=(CAGradientLayer *)self.layer;
    
    if ([gradientLayer animationForKey:kAnimationKey]==nil) {
        
        CABasicAnimation *startPointAnimation=[CABasicAnimation animationWithKeyPath:kGradientStartPointKey];
        startPointAnimation.toValue=[NSValue valueWithCGPoint:CGPointMake(1.0, 0.0)];
        startPointAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        CABasicAnimation *endPointAnimation = [CABasicAnimation animationWithKeyPath:kGradientEndPointKey];
        endPointAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1+self.gradientWidth, 0)];
        endPointAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        

   //以下内容无问题
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = @[startPointAnimation, endPointAnimation];
        group.duration = self.animationDuration;
        group.repeatCount = FLT_MAX;
        
        [gradientLayer addAnimation:group forKey:kAnimationKey];

        }else
            NSLog(@"Did running!\n");

}

+ (Class)layerClass
{
    return [CAGradientLayer class];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
