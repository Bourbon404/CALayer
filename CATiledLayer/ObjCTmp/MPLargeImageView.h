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
 超大图片展示view
 */
@interface MPLargeImageView : UIView

/**
 设置图片显示模式
 */
@property (nonatomic, assign) UIViewContentMode contentMode;
/**
 图片原地址
 */
@property (nonatomic, copy) NSString *imagePath;
/**
 图片原名称
 */
@property (nonatomic, copy) NSString *iamgeName;
/**
 图片承载框架的大小
 */
@property (nonatomic, assign) CGRect frame;

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
