//
//  ViewController.m
//  ZWLoading
//
//  Created by Bourbon on 16/1/20.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ViewController.h"
#import "ZWLoadingView.h"
#import "ZWSharpLayer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    ZWLoadingView *loading = [[ZWLoadingView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    [loading setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:loading];
    
//    [ZWSharpLayer addLoadingInView:self.view];
    ZWSharpLayer *layer = [[ZWSharpLayer alloc] init];
    [layer addLoadingInView:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
