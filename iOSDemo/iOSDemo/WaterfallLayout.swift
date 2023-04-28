//
//  1.swift
//  SecondDemo
//
//  设置controllerView的布局
//  Created by qinxin on 2023/4/28.
//

import UIKit

protocol WaterFallLayoutDelegate: NSObjectProtocol {
    //为每个 Cell 提供动态的高度
    func waterFlowLayout(_ waterFlowLayout: WaterfallLayout, itemHeight indexPath: IndexPath) -> CGFloat
}

class WaterfallLayout: UICollectionViewFlowLayout {
    
    weak var delegate: WaterFallLayoutDelegate?
    
    // 定义瀑布流列数和单元格宽度
    let columnCount = 2
    let itemWidth = (UIScreen.main.bounds.width - 20) / 2
    
    // 定义存储每一列的总高度的数组
    var columnHeights = [CGFloat]()
    // 定义最高的高度
    
    var maxHeight: CGFloat = 0
    // 属性缓存
    var attributesCache: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        
        // 初始化每一列的高度
        columnHeights = Array(repeating: 0, count: columnCount)
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0){
            
            let indexPath = IndexPath(item: item, section: 0);
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // 计算单元格的高度和位置
            // 获取动态高度
            let itemHeight = delegate?.waterFlowLayout(self, itemHeight: indexPath)
            
            
            //找到目前所有列中高度最小的一列
            let minHeight = columnHeights.min() ?? 0
            
            //找到高度最小的列的索引
            let column = columnHeights.firstIndex(of: minHeight) ?? 0
            
            //计算单元格x的坐标
            let x = CGFloat(column) * itemWidth + 5 + CGFloat(column) * 10
            
            //计算单元格y的坐标
            let y = columnHeights[column] + 5;
            
            attributes.frame = CGRect(x: x, y: y, width: itemWidth, height:CGFloat(itemHeight!))

            
            // 更新列高度
            columnHeights[column] = attributes.frame.maxY
            attributesCache.append(attributes);
        }
        maxHeight = columnHeights.max()! + sectionInset.bottom
    }
}

extension WaterfallLayout {
    
    //返回当前可见区域内的所有单元格和补充视图的布局属性对象
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //过滤掉那些不在可见范围内的单元格和补充视图，只保留在当前可见区域内的单元格和补充视图的布局属性对象
        return attributesCache.filter {
            $0.frame.intersects(rect)
        }
    }
    
    // 重写 collectionViewContentSize 属性，计算整个 collectionView 的滚动范围
    override var collectionViewContentSize: CGSize {
        
        // 确保 collectionView 存在
        guard let collectionView = collectionView else {
            // 如果不存在，则返回 CGSize.zero
            return CGSize.zero
        }
        return CGSize(width: collectionView.bounds.width, height: maxHeight)
    }
}

extension WaterfallViewController: WaterFallLayoutDelegate{
    func waterFlowLayout(_ waterFlowLayout: WaterfallLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(200) + 150)
    }
}
