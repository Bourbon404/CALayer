//
//  ViewController.m
//  CAEmitter
//
//  Created by ZhengWei on 16/5/3.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.emitterLayer.emitterPosition = self.view.center;
    [self.view.layer addSublayer:self.emitterLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.emitterLayer.emitterPosition = point;
}

#pragma mark 初始化
-(CAEmitterLayer *)emitterLayer
{
    if (_emitterLayer == nil) {
        _emitterLayer = [[CAEmitterLayer alloc] init];
        //设置为混合模式
        _emitterLayer.renderMode = kCAEmitterLayerAdditive;
        //生成一个发射点
        _emitterLayer.birthRate = 1;
        
        CAEmitterCell *cell = [CAEmitterCell emitterCell];
        //cell的如下值是必须要设置的，否则不会出现
        cell.contents = CFBridgingRelease([UIImage imageNamed:@"1"].CGImage);
        //粒子发射方向，与x轴的角度
        cell.emissionLongitude = M_PI_2+M_PI;
        //粒子发射范围，与上一个值得正负值范围
        cell.emissionRange = M_PI_2;
        //移动速度
        cell.velocity = 100;
        cell.velocityRange = 80;
        //存活时间和初始速度
        cell.lifetime = 4;
        //每秒生成数
        cell.birthRate = 50;
        cell.scale = 0.2;
        [cell setName:@"cell"];
        
        _emitterLayer.emitterCells = @[cell];
    }
    return _emitterLayer;
}
@end
