//
//  MyLayout.m
//  UICollectionViewTestOne
//
//  Created by QinTuanye on 2018/6/27.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
{
    // 这个竖直是我们自定义的布局配置数组
    NSMutableArray *_attributeArray;
}

// 数组的相关设置在这个方法中
// 布局前的准备会调用这个方法
- (void)prepareLayout {
    _attributeArray = [[NSMutableArray alloc] init];
    // 为方便演示，我们设置为静态的2列
    // 计算每一个Item的宽度
    float WIDTH = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2;
    // 定义数组保存每一列的高度
    // 这个数组的主要作用是保存每一列的总高度，这样在布局是，我们可以始终将下一个Item放在最短的列下面
    CGFloat colHight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    // itemCount是外界传进来的Item的个数，遍历来设置每一个Item的布局
    for (int i = 0; i < _itemCount; i++) {
        // 设置每个Item的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建一个布局属性类，通过indexPath来创建
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        // 随机一个高度，在40-190之间
        CGFloat hight = arc4random() % 150 + 40;
        // 哪一列高度小，则放到那一列下面
        // 标记最短的列
        int width = 0;
        if (colHight[0] < colHight[1]) {
            // 将新的Item高度加入短的一列
            colHight[0] = colHight[0] + hight + self.minimumLineSpacing;
            width = 0;
        } else {
            colHight[1] = colHight[1] + hight + self.minimumLineSpacing;
            width = 1;
        }
        
        // 设置Item的位置
        attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHight[width] - hight - self.minimumInteritemSpacing, WIDTH, hight);
        [_attributeArray addObject:attris];
    }
    
    // 设置itemSize，确保滑动范围在正确区间，这里是通过将所有的Item高度平均化计算出来的
    // （以最高的列为标准）
    if (colHight[0] > colHight[1]) {
        self.itemSize = CGSizeMake(WIDTH, (colHight[0] - self.sectionInset.top)  * 2 / _itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(WIDTH, (colHight[1] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    }
}

// 这个方法会返回设置好的布局数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}
@end
