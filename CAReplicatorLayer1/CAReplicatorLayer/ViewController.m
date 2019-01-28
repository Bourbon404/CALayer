//
//  ViewController.m
//  CAReplicatorLayer
//
//  Created by ZhengWei on 16/5/4.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"american-flag"];
    UIView *view = [self view];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    [replicatorLayer setContentsScale:[[UIScreen mainScreen] scale]];
    [replicatorLayer setBounds:CGRectMake(0, 0, image.size.width, image.size.height * 1.5)];
    [replicatorLayer setMasksToBounds:YES];
    [replicatorLayer setAnchorPoint:CGPointMake(0.5, 0)];
    [replicatorLayer setPosition:CGPointMake(view.frame.size.width/2.0, 80)];
    [replicatorLayer setInstanceCount:2];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DScale(transform, 1.0, -1.0, 1.0);
    transform = CATransform3DTranslate(transform, 0.0, -image.size.height * 2, 1.0);
    [replicatorLayer setInstanceTransform:transform];
    
    CALayer *imageLayer = [CALayer layer];
    [imageLayer setContentsScale:[[UIScreen mainScreen] scale]];
    [imageLayer setContents:(id)[image CGImage]];
    [imageLayer setBounds:CGRectMake(0, 0, image.size.width, image.size.height)];
    [imageLayer setAnchorPoint:CGPointMake(0, 0)];
    [replicatorLayer addSublayer:imageLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setContentsScale:[[UIScreen mainScreen] scale]];
    [gradientLayer setColors:@[
                               (id)[[[UIColor whiteColor] colorWithAlphaComponent:0.25] CGColor],
                               (id)[[UIColor whiteColor] CGColor]
                               ]];
    [gradientLayer setBounds:CGRectMake(0, 0, replicatorLayer.frame.size.width, image.size.height*0.5+1)];
    [gradientLayer setAnchorPoint:CGPointMake(0.5, 0)];
    [gradientLayer setPosition:CGPointMake(view.frame.size.width/2.0, image.size.height+80)];
    [gradientLayer setZPosition:1];
    
    [[view layer] addSublayer:replicatorLayer];
    [[view layer] addSublayer:gradientLayer];
    
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 200)];
//    [path addLineToPoint:CGPointMake(400, 200)];
//    [path addLineToPoint:CGPointMake(250, 400)];
//    [path addLineToPoint:CGPointMake(100, 200)];
//    [path moveToPoint:CGPointMake(250, 100)];
//    [path addLineToPoint:CGPointMake(400, 300)];
//    [path addLineToPoint:CGPointMake(100, 300)];
//    [path closePath];
//    
//    UIView *roundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//    roundView.layer.cornerRadius = 5;
//    roundView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
//    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    animation.path = path.CGPath;
//    animation.duration = 8;
//    animation.repeatCount = CGFLOAT_MAX;
//    [roundView.layer addAnimation:animation forKey:@"round"];
//    
//    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
//    replicatorLayer.instanceCount = 40;
//    replicatorLayer.instanceDelay = 0.2;
//    replicatorLayer.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
//    replicatorLayer.instanceRedOffset = -0.02;
//    replicatorLayer.instanceBlueOffset = -0.02;
//    replicatorLayer.instanceGreenOffset = -0.02;
//    [replicatorLayer addSublayer:roundView.layer];
//    
//    [self.view.layer addSublayer:replicatorLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
