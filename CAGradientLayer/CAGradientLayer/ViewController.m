//
//  ViewController.m
//  CAGradientLayer
//
//  Created by ZhengWei on 16/5/3.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CAGradientLayer *gradientLayer;
    int i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"1.jpeg"];
    UIImageView *view = [[UIImageView alloc] initWithImage:image];
    [view setFrame:self.view.frame];
    [self.view addSubview:view];
    
    
    //添加渐变色
    gradientLayer = [CAGradientLayer layer];
    [gradientLayer setColors:@[
                               (id)[UIColor redColor].CGColor,
                               (id)[UIColor blueColor].CGColor,
                               ]];
    [gradientLayer setStartPoint:CGPointMake(0, 0)];
    [gradientLayer setEndPoint:CGPointMake(1, 1)];
    [gradientLayer setOpacity:0.5];
    [gradientLayer setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view.layer addSublayer:gradientLayer];
    i = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
}
-(void)change
{
    i = i + 1;
    CGFloat tmp = i % 10 / 10.0;
    
    [gradientLayer setLocations:@[
                                  @(tmp),
                                  ]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
