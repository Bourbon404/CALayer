//
//  ViewController.m
//  CAScrollLayer
//
//  Created by 郑伟 on 2019/3/15.
//  Copyright © 2019 BourbonZ. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.borderColor = [UIColor redColor].CGColor;
    layer.borderWidth = 1;
    layer.bounds = CGRectMake(0, 0, 300, 300);
    layer.contents = (__bridge id)[UIImage imageNamed:@"1.PNG"].CGImage;
    
    ScrollView *scroll = [[ScrollView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:scroll];
    [scroll.layer addSublayer:layer];
    
}


@end
