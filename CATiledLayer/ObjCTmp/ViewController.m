//
//  ViewController.m
//  ObjCTmp
//
//  Created by BourbonZ on 2018/10/31.
//  Copyright © 2018 BourbonZ. All rights reserved.
//

#import "ViewController.h"
#import "MPLargeImageView.h"
@interface ViewController (){
    UIImageView *imageView;
    MPLargeImageView *largeImage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tmp2" ofType:@"jpg"];
//    imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:path]];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:imageView];
//    imageView.frame = self.view.bounds;

    
    largeImage = [[MPLargeImageView alloc] init];
    largeImage.frame = self.view.bounds;
    largeImage.imagePath = path;
    largeImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:largeImage];
    largeImage.backgroundColor = [UIColor redColor];
}


@end
