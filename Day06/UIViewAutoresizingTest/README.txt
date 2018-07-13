UIViewAutoresizing（布局模式）使用方法

（1）设置自适应模式
	view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;

（2）UIViewAutoresizing实际上是UIKit框架中的一个枚举，其枚举值与含义如下：
	UIViewAutoresizingNone                  // 默认
	UIViewAutoresizingFlexibleLeftMargin    // 与父视图右边间距固定，左边距可变
	UIViewAutoresizingFlexibleWidth         // 视图宽度可变
	UIViewAutoresizingFlexibleRightMargin   // 与父视图左边间距固定，右边距可变
	UIViewAutoresizingFlexibleTopMargin     // 与符视图下边距固定，上边距可变
	UIViewAutoresizingFlexibleHeight        // 视图高度可变
	UIViewAutoresizingFlexibleBottomMargin  // 与父视图上边间距固定，下边距可变
    提示：由NS_OPTIONS可以得知，UIViewAutoresizing枚举中的枚举值是可以进行按位或运算来结合使用的。

（3）简单来说，控件的autoresizingMask属性就是设置当控件父视图尺寸改变时，控件的上、下、左、右边距及宽高的拉伸情况。