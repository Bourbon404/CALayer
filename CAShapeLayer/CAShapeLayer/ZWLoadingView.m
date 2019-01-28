//
//  ZWLoadingView.m
//  ZWLoading
//
//  Created by Bourbon on 16/1/20.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ZWLoadingView.h"

@implementation ZWLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//-(void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    //直径
//    CGFloat line = 100;
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //设置位置
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, line, 0);
//    CGContextAddArc(context, line/2, 0, line/2, 0, M_PI_2, NO);
//    CGContextAddArc(context, line/2, line, line/2, -M_PI_2, 0, NO);
//    CGContextAddLineToPoint(context, 0, line);
//    CGContextAddArc(context, line/2, line, line/2, M_PI, -M_PI_2, NO);
//    CGContextAddArc(context, line/2, 0, line/2, M_PI_2, M_PI, NO);
//    
//    //设置颜色
//    CGContextSetLineWidth(context, 1);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    
//    //绘制
//    CGContextStrokePath(context);
//}
@end
