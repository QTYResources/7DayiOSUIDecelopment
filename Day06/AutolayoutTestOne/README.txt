AutoLayout使用方法（一）

（1）用鼠标选中控件，按住Control键不放，将鼠标拖曳至UIImageView本身，会弹出autolayout菜单，将弹出菜单中的Width与Height选项选中，Width选项的含义为约束控件的宽度始终保持不变，Height选项的含义为约束控件的高度始终保持不变。

（2）用鼠标选中控件，按住Control键不放，将鼠标移动至其父视图上，这时会弹出添加约束的菜单。选中菜单中的Center Horizontally与Center Vertically选项。Center Horizontally与Center vertically分别会将控件约束在其父视图的水平中心和竖直中心。

（3）使用autolayout进行约束布局是，主要有两种类型。一种是子视图控件与父视图控件之间的约束关系，另一种是平级视图之间的约束关系。可设置的约束关系有以下几种：
	Width                                   // 对视图宽度的约束
	Height                                  // 对视图高度的约束
	Aspect Ratio                            // 对视图的宽高比进行约束
	Leading Space to Container Margin       // 对视图左边距与其他视图进行约束
	Trailing Space to Container Margin      // 对视图右边距与其他视图进行约束
	Vertical Spacing to Top Layout Guide    // 对视图上边距与其他视图进行约束
	Vertical Spacing to Bottom Layout Guid  // 对视图下边距与其他视图进行约束
	Center Horizontally in Container        // 对视图竖直中心线与其他视图进行约束
	Center Vertically in Container          // 对视图水平中心线与其他视图进行约束
	Equal Widths                            // 约束两视图宽度相等
	Equal Heights                           // 约束两视图高度相等

（4）注意：使用autolayout进行布局，一定要将ViewController的Use Auto Layout选项勾选。