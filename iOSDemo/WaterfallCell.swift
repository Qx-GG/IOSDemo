//
//  waterfallcell.swift
//  SecondDemo
//  自定义单元格
//  Created by qinxin on 2023/4/28.
//

import UIKit

class WaterfallCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var summaryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 初始化图片视图
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        
        // 初始化摘要标签
        summaryLabel = UILabel()
        summaryLabel.textAlignment = .center
        summaryLabel.font = UIFont.systemFont(ofSize: 14)
        summaryLabel.numberOfLines = 0
        contentView.addSubview(summaryLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 为 contentView 添加边框
        self.contentView.layer.borderWidth = 2.0    //边框粗度
        self.contentView.layer.borderColor = UIColor.gray.cgColor   //边框颜色
        //设置圆角
        self.contentView.layer.cornerRadius = 8.0   //半径
        self.contentView.layer.masksToBounds = true
    }

}
