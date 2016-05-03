# CAEmitterLayer
QuartzCore应用-CAEmitterLayer粒子效果


查看更多请访问网站 ====》 [点我点我快点我](http://www.bourbonz.cn)

一
最近直播类型的软件挺流行的，然后发现了一个这样的粒子效果挺有趣的，决定实践下

![这个不算盗图吧](http://www.bourbonz.cn/wp-content/uploads/2016/05/emitter.gif)

先说实现这种效果的步骤，很简单，主要分三部:
1,设置_CAEmitterLayer_发射器
2,设置_CAEmitterCell_粒子效果
3,添加到需要显示的_Layer_上

二
先说下_CAEmitterLayer_,文档上是这样介绍的
粒子发射层,每一个发生器都有一个_Cells_数组,这些定义了粒子怎么被发射出去和如何展示在层上.
粒子系统受层同步影响.模拟行为于成都开始时间启动.
粒子会画在背景色和层的边框之上.
看下他的几个属性:

```
//附属在层上的粒子数组，每一个对象必须是CAEmitterCell的子类
@property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;

//每一个cell的初始速度是由该数字乘以给定的每秒创建粒子的数量，默认值是1/s
@property float birthRate;

//cell生命周期是由该数字乘以粒子什么时候创建，默认是1s 
@property float lifetime;

//发射器的中心位置，默认是(0,0,0)
@property CGPoint emitterPosition;
@property CGFloat emitterZPosition;

//发射器的大小，默认是(0, 0, 0).依靠‘ emitterShape’属性，一些值可能会被忽略
@property CGSize emitterSize;
//发射器的深度，有时可能会产生立体效果
@property CGFloat emitterDepth;

//一个定义好的发射器形状的字符串,当前可选有'point' (默认), `line', `rectangle', `circle', `cuboid' 和 `sphere'. 
@property(copy) NSString *emitterShape;

//一个定义好的字符串，表示粒子相对发射器怎么被创建，当前可选有`points', `outline', `surface' 和 `volume' (默认).
@property(copy) NSString *emitterMode;

//一个定义了发射渲染模式的字符串，当前可选的有 `unordered' (默认), `oldestFirst', `oldestLast', `backToFront' (i.e. sorted into Z order) and `additive'. 前四个是使用源在合成，最后一个是各种模式的混合
@property(copy) NSString *renderMode;

//是否开启三维空间模式
@property BOOL preservesDepth;

//粒子的移动速度,默认是1
@property float velocity;

//粒子的缩放大小,默认是1
@property float scale;

/* Multiplies the cell-defined particle spin. Defaults to one. Animatable. */
//粒子的旋转角度
@property float spin;

//用来生成随机因子的初始化种子，默认是0，每一个层都有一个他自己的RNG状态，具有一个平均值M和范围值R，取值范围在[M - R/2, M + R/2]之间。
@property unsigned int seed;
```

定义好的字符串类型

```
/** `发射器形状取值' values. **/
CA_EXTERN NSString * const kCAEmitterLayerPoint
//从一个点发出
CA_EXTERN NSString * const kCAEmitterLayerLine
//沿一条线发出
CA_EXTERN NSString * const kCAEmitterLayerRectangle
//从一个矩形发出
CA_EXTERN NSString * const kCAEmitterLayerCuboid
//从一个立方体发出
CA_EXTERN NSString * const kCAEmitterLayerCircle
//从一个圆形中发出
CA_EXTERN NSString * const kCAEmitterLayerSphere

/** `发射器发射模式' values. **/

CA_EXTERN NSString * const kCAEmitterLayerPoints
//从发射器中发出
CA_EXTERN NSString * const kCAEmitterLayerOutline
//从发射器轮廓发出
CA_EXTERN NSString * const kCAEmitterLayerSurface
 //从发射器表面发出
CA_EXTERN NSString * const kCAEmitterLayerVolume
//从发射器中点发出
/** `发射器渲染模式' values. **/

CA_EXTERN NSString * const kCAEmitterLayerUnordered
//无序
CA_EXTERN NSString * const kCAEmitterLayerOldestFirst
//最久的在最上面
CA_EXTERN NSString * const kCAEmitterLayerOldestLast
//最久的在最下面
CA_EXTERN NSString * const kCAEmitterLayerBackToFront
//按照Z轴，由后到前
CA_EXTERN NSString * const kCAEmitterLayerAdditive
//混合模式

NS_ASSUME_NONNULL_END

```

二
说完粒子发射器，接下来聊聊粒子
这东西是一个遵循了_CAMediaTiming_协议的对象
```
//类方法的方式创建一个粒子
+ (instancetype)emitterCell;

//粒子实现继承自CALayer的相同属性
+ (nullable id)defaultValueForKey:(NSString *)key;
- (BOOL)shouldArchiveValueForKey:(NSString *)key;

//粒子的名字,来实现键值匹配
@property(nullable, copy) NSString *name;

//控制是否打开粒子渲染效果
@property(getter=isEnabled) BOOL enabled;

//粒子的初始速度
@property float birthRate;

//粒子的生命周期和时间容差,默认都是0
@property float lifetime;
@property float lifetimeRange;

//设置粒子的在xy平面轴和z轴的发射角度
@property CGFloat emissionLatitude;
@property CGFloat emissionLongitude;

//粒子发射角度的范围
@property CGFloat emissionRange;

//粒子的速度和速度范围
@property CGFloat velocity;
@property CGFloat velocityRange;

//x，y，z轴方向上的加速度
@property CGFloat xAcceleration;
@property CGFloat yAcceleration;
@property CGFloat zAcceleration;

//粒子的缩放，缩放范围，缩放速度
@property CGFloat scale;
@property CGFloat scaleRange;
@property CGFloat scaleSpeed;

//旋转角度和角度范围
@property CGFloat spin;
@property CGFloat spinRange;

//每一个粒子的平均颜色，和颜色范围
@property(nullable) CGColorRef color;
@property float redRange;
@property float greenRange;
@property float blueRange;
@property float alphaRange;

/* The speed at which color components of emitted objects change over
 * their lifetime, defined as the rate of change per second. Defaults
 * to (0, 0, 0, 0). Animatable. */

@property float redSpeed;
@property float greenSpeed;
@property float blueSpeed;
@property float alphaSpeed;

//是一个CGImageRef类型的内容
@property(nullable, strong) id contents;

//内容大小
@property CGRect contentsRect;

//内容缩放程度
@property CGFloat contentsScale;

//内容的缩小或放大滤镜
@property(copy) NSString *minificationFilter;
@property(copy) NSString *magnificationFilter;
@property float minificationFilterBias;

//一个包含子粒子的粒子数组
@property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;

//设置粒子的样式
@property(nullable, copy) NSDictionary *style;

```

三
解释了这么多文档上的内容，下面说展示下效果

![最终效果1]http://www.bourbonz.cn/wp-content/uploads/2016/05/emitter-result.gif)
![最终效果2](http://www.bourbonz.cn/wp-content/uploads/2016/05/emitter-result-2.gif)

四
最后放代码
[点我点我快点我](https://github.com/zhwe130205/CAEmitterLayer)
