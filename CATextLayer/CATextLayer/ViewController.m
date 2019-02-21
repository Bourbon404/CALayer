//
//  ViewController.m
//  CATextLayer
//
//  Created by 郑伟 on 2019/2/21.
//  Copyright © 2019 BourbonZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CATextLayer *textLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     * 单纯的使用 CATextLayer 具备快速的性能优势，纯显示文本功能
     */
    
    
    self.textLayer = [[CATextLayer alloc] init];
    
    //文字内容，可以是 NSString 或者 NSAttributedString 类型
    self.textLayer.string = @"fjdlksajflksa附近打卡死了废旧塑料卡积分卡洛斯解放路空间撒弗兰克的撒恢复萨克雷烦死了卡减肥的刷卡缴费卡洛斯";
    
    //下面的三个属性只有在 string 属性是 NSString 类型时生效
    {
        //字体，可以是 CTFontRef、CGFontRef 或者是 NSString （字体名称）默认值是 Helvetica
        self.textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:12]);
        //字号，默认是36
        self.textLayer.fontSize = 12;
        //字体颜色
        self.textLayer.foregroundColor = [UIColor redColor].CGColor;
    }

    //超出内容后，是否自动换行
    self.textLayer.wrapped = YES;
    //省略号的位置
    self.textLayer.truncationMode = kCATruncationEnd;
    //文本对齐
    self.textLayer.alignmentMode = kCAAlignmentRight;
    //内容的分辨率，默认值为1
    self.textLayer.contentsScale = [UIScreen mainScreen].scale;
    //是否具备颗粒度？默认值为NO
    self.textLayer.allowsFontSubpixelQuantization = YES;


    self.textLayer.frame = CGRectMake(50, 50, 200, 200);
    [self.view.layer addSublayer:self.textLayer];

}


@end
