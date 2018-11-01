//
//  MPLargeImageView.m
//  ObjCTmp
//
//  Created by BourbonZ on 2018/10/31.
//  Copyright © 2018 BourbonZ. All rights reserved.
//

#import "MPLargeImageContentView.h"
@interface MPLargeImageContentView () {

    CGFloat imageScale; //图片的缩放比例
    CGRect originRect;  //外部承载框的大小
    CGRect imageRect;   //图片的原始大小
}
@property (nonatomic, strong) UIImage *originImage;
@property (nonatomic, copy) NSString *imageName;
@end
@implementation MPLargeImageContentView

- (void)dealloc {

}

+ (Class)layerClass {
    return [CATiledLayer class];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect imageCutRect = CGRectMake(rect.origin.x / imageScale,
                                     rect.origin.y / imageScale,
                                     rect.size.width / imageScale,
                                     rect.size.height / imageScale);

    //截取指定图片区域，重绘
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.originImage.CGImage, imageCutRect);
    UIImage *tileImage = [UIImage imageWithCGImage:imageRef];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    [tileImage drawInRect:rect];
    UIGraphicsPopContext();
    
    CGImageRelease(imageRef);
}

- (instancetype)initWithFrame:(CGRect)frame withImagePath:(NSString *)imagePath {
    
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        originRect = frame;
        self.imagePath = imagePath;

        CGFloat scale = frame.size.width / CGImageGetWidth(self.originImage.CGImage);
        CGFloat height = scale * CGImageGetHeight(self.originImage.CGImage);
        CGRect targetFrame = CGRectMake(0, 0, frame.size.width, height);
        self.frame = targetFrame;

        imageScale = CGRectGetWidth(self.frame) / CGImageGetWidth(_originImage.CGImage);
        [self setNeedsDisplay];

    } return self;
}

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName.stringByDeletingPathExtension ofType:imageName.pathExtension];
    return [self initWithFrame:frame withImagePath:path];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.contentMode == UIViewContentModeScaleAspectFit) {
        //自适应填充
        CGFloat offsetY = (originRect.size.height - self.frame.size.height) / 2.0f;
        CGRect frame = self.frame;
        frame.origin.y = offsetY;
        self.frame = frame;
    } else if (self.contentMode == UIViewContentModeScaleAspectFill) {
        //自适应缩放
        
        //
        if (CGImageGetWidth(self.originImage.CGImage) >= CGImageGetHeight(self.originImage.CGImage)) {
            //横图
            
            CGFloat height = MIN(CGRectGetHeight(originRect), CGImageGetHeight(self.originImage.CGImage));
            imageScale = height / CGImageGetHeight(self.originImage.CGImage);
            CGFloat width = MIN(imageScale * CGImageGetWidth(self.originImage.CGImage), CGRectGetWidth(originRect));
            
            
            CGRect frame = CGRectZero;
            frame.origin.x = (CGRectGetWidth(originRect) - width) / 2.0;
            frame.origin.y = (CGRectGetHeight(originRect) - height) / 2.0f;
            frame.size.width = width;
            frame.size.height = height;
            self.frame = frame;
        } else {
            //竖图
            CGFloat width = MIN(CGRectGetWidth(originRect), CGImageGetWidth(self.originImage.CGImage));
            imageScale = width / CGImageGetWidth(self.originImage.CGImage);
            CGFloat height = MIN(imageScale * CGImageGetHeight(self.originImage.CGImage), CGRectGetHeight(originRect));
            
            
            CGRect frame = CGRectZero;
            frame.origin.x = (CGRectGetWidth(originRect) - width) / 2.0;
            frame.origin.y = (CGRectGetHeight(originRect) - height) / 2.0f;
            frame.size.width = width;
            frame.size.height = height;
            self.frame = frame;
        }
    }
}


#pragma mark Property
- (void)setOriginImage:(UIImage *)originImage {
    if (_originImage != originImage) {
        
        _originImage = originImage;
        
        imageScale = CGRectGetWidth(self.frame) / CGImageGetWidth(_originImage.CGImage);

        [self setNeedsDisplay];
        
//        CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
//        int lev = ceil(log2(1/imageScale))+1;
//        tiledLayer.levelsOfDetail = 1;
//        tiledLayer.levelsOfDetailBias = lev;
    }
}

- (void)setImagePath:(NSString *)imagePath {
    if (_imagePath != imagePath) {
        _imagePath = imagePath;
        
        self.originImage = [UIImage imageWithContentsOfFile:imagePath];
    }
}
@end
