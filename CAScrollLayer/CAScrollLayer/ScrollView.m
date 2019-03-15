//
//  ScrollView.m
//  CAScrollLayer
//
//  Created by 郑伟 on 2019/3/15.
//  Copyright © 2019 BourbonZ. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [self addGestureRecognizer:pan];
        
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self];
    CGPoint offset = self.bounds.origin;
    offset.x -= translation.x;
    offset.y -= translation.y;
    
    [(CAScrollLayer *)self.layer scrollPoint:offset];
    [gesture setTranslation:CGPointZero inView:self];
}
@end
