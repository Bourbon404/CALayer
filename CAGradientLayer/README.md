# QuartzCore应用-CAGradientLayer添加渐变

标签（空格分隔）： QuartzCore iOS CAGradientLayer 

---

这次想要说的内容比较简单，是给界面添加渐变，看下效果图

![渐变图](http://www.bourbonz.cn/wp-content/uploads/2016/05/gradientLayer.png)

通过CAGradientLayer来实现这样的效果很简单，看下如何实现
文档上说这个渐变图层会在背景色上添加一个具有渐变的颜色，并填充整个图层，包括圆角
需要设置如下内容： 
1,一个内容是_CGColorRef_类型的颜色数组
2,一个内容是_NSNumber_类型，并且取值在0到1之间的位置数组
3,一个开始位置和结束位置，其中(0.0)代表屏幕的左上角，(1,1)代表屏幕的右下角,
  默认值是(0.5,0)和(0.5,1)
4,最后是渐变类型，目前文档上只给出了一种类型_Axial_轴向的，这也是此种方式貌似只能形成线性的渐变，不能形成圆形或其他类型的原因吧

如果想要添加一些动画的话，可以尝试动态更改_locations_ 和 _colors_ 属性，这样可以实现动态渐变的改变
![动态图](http://www.bourbonz.cn/wp-content/uploads/2016/05/gradientLayer-animation.gif)


[点我下载代码](https://github.com/zhwe130205/CAGradientLayer)





