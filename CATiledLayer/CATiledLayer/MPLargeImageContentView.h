//
//  MPLargeImageView.h
//  ObjCTmp
//
//  Created by BourbonZ on 2018/10/31.
//  Copyright © 2018 BourbonZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 超大图片内容框，外部不能直接应用并创建
 */
@interface MPLargeImageContentView : UIView

@property (nonatomic, copy) NSString *imagePath;

/**
 设置图片显示模式，目前仅支持UIViewContentModeScaleAspectFit、UIViewContentModeScaleAspectFill、UIViewContentModeScaleToFill
 且默认为 UIViewContentModeScaleToFill
 */
@property (nonatomic, assign) UIViewContentMode contentMode;

/**
 创建并展示图片

 @param frame 图片承载框的大小
 @param imagePath 图片存储路径
 @return 返回图片view
 */
- (instancetype)initWithFrame:(CGRect)frame withImagePath:(NSString *)imagePath;
/**
 创建并展示图片

 @param frame 图片承载框的大小
 @param imageName 图片的名称，默认jpg
 @return 返回图片view
 */
- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
