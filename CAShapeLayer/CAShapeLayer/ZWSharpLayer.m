//
//  ZWSharpLayer.m
//  ZWLoading
//
//  Created by Bourbon on 16/1/20.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ZWSharpLayer.h"

@interface ZWSharpLayer ()
{
    CAShapeLayer *shapeLayer;
    
    CAShapeLayer *firstLayer;
    CAShapeLayer *secondLayer;
    double add;
}
@end
@implementation ZWSharpLayer
-(void)addLoadingInView:(UIView *)view
{
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame         = CGRectMake(0, 0, 200, 200);
    shapeLayer.position      = view.center;
    shapeLayer.lineWidth     = 1.0f;
    shapeLayer.strokeColor   = [UIColor redColor].CGColor;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    UIBezierPath *circle = [UIBezierPath bezierPath];
    [circle moveToPoint:CGPointMake(0, 0)];
    [circle addLineToPoint:CGPointMake(200, 0)];
    [circle addArcWithCenter:CGPointMake(100, 0) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [circle addArcWithCenter:CGPointMake(100, 200) radius:100 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    [circle addLineToPoint:CGPointMake(0, 200)];
    [circle addArcWithCenter:CGPointMake(100, 200) radius:100 startAngle:M_PI endAngle:-M_PI_2 clockwise:YES];
    [circle addArcWithCenter:CGPointMake(100, 0) radius:100 startAngle:M_PI_2 endAngle:-M_PI clockwise:YES];
    shapeLayer.path          = circle.CGPath;
    [view.layer addSublayer:shapeLayer];

    
    firstLayer = [CAShapeLayer layer];
    firstLayer.frame = CGRectMake(0, 0, 200, 200);
    firstLayer.position = view.center;
    firstLayer.lineWidth = 2.0f;
    firstLayer.strokeColor = [UIColor purpleColor].CGColor;
    firstLayer.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:firstLayer];
    
    UIBezierPath *linePath1 = [UIBezierPath bezierPath];
    [linePath1 moveToPoint:CGPointMake(0, 0)];
    [linePath1 addLineToPoint:CGPointMake(200, 0)];
    [linePath1 addArcWithCenter:CGPointMake(100, 0) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [linePath1 addArcWithCenter:CGPointMake(100, 200) radius:100 startAngle:-M_PI_2 endAngle:M_PI clockwise:NO];
    firstLayer.path = linePath1.CGPath;
    firstLayer.strokeStart = 0;
    firstLayer.strokeEnd = 0;

    
    secondLayer = [CAShapeLayer layer];
    secondLayer.frame = CGRectMake(0, 0, 200, 200);
    secondLayer.position = view.center;
    secondLayer.lineWidth = 2.0f;
    secondLayer.strokeColor = [UIColor yellowColor].CGColor;
    secondLayer.fillColor = [UIColor clearColor].CGColor;
    [view.layer addSublayer:secondLayer];
    
    UIBezierPath *linePath2 = [UIBezierPath bezierPath];
    [linePath2 moveToPoint:CGPointMake(0, 200)];
    [linePath2 addLineToPoint:CGPointMake(200, 200)];
    [linePath2 addArcWithCenter:CGPointMake(100, 200) radius:100 startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    [linePath2 addArcWithCenter:CGPointMake(100, 0) radius:100 startAngle:M_PI_2 endAngle:-M_PI clockwise:YES];
    secondLayer.path = linePath2.CGPath;
    secondLayer.strokeStart = 0;
    secondLayer.strokeEnd = 0;

    
    add = 0.03;
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(drawCircle) userInfo:nil repeats:YES];
}
-(void)drawCircle
{
    if (firstLayer.strokeEnd > 1 && firstLayer.strokeStart < 1) {
        firstLayer.strokeStart += add;
        secondLayer.strokeStart += add;

    }else if(firstLayer.strokeStart == 0){
        firstLayer.strokeEnd += add;
        secondLayer.strokeEnd += add;

    }
    
    if (firstLayer.strokeEnd == 0) {
        firstLayer.strokeStart = 0;
        secondLayer.strokeStart = 0;

    }
    
    if (firstLayer.strokeStart == firstLayer.strokeEnd) {
        firstLayer.strokeEnd = 0;
        secondLayer.strokeEnd = 0;

    }
    if (firstLayer.strokeStart > 1 && firstLayer.strokeEnd > 1)
    {
        firstLayer.strokeStart = 0;
        firstLayer.strokeEnd = 0;
        
        secondLayer.strokeStart = 0;
        secondLayer.strokeEnd = 0;

    }
}
@end
