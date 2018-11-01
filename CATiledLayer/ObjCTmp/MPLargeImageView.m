//
//  MPLargeImageView.m
//  ObjCTmp
//
//  Created by BourbonZ on 2018/10/31.
//  Copyright © 2018 BourbonZ. All rights reserved.
//

#import "MPLargeImageView.h"
#import "MPLargeImageContentView.h"
@interface MPLargeImageView ()
@property (nonatomic, strong) MPLargeImageContentView *imageView;
@end
@implementation MPLargeImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {

}

- (instancetype)initWithFrame:(CGRect)frame withImagePath:(NSString *)imagePath {
    
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
        self.imagePath = imagePath;
        
    } return self;
}

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName {
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName.stringByDeletingPathExtension ofType:imageName.pathExtension];
    return [self initWithFrame:frame withImagePath:path];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (![self.subviews containsObject:self.imageView]) {
        [self addSubview:self.imageView];
    }
}

#pragma mark Property
- (MPLargeImageContentView *)imageView {
    if (!_imageView) {
        _imageView = [[MPLargeImageContentView alloc] initWithFrame:self.frame withImagePath:self.imagePath];
    } return _imageView;
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    if (_contentMode != contentMode) {
        _contentMode = contentMode;
        self.imageView.contentMode = _contentMode;
    }
}

- (void)setImagePath:(NSString *)imagePath {
    if (_imagePath != imagePath) {
        _imagePath = imagePath;
        self.imageView.imagePath = _imagePath;
    }
}
@end
