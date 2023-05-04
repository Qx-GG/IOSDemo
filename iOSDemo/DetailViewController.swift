//
//  DetailViewController.swift
//  SecondDemo
//  DetailViewController类用于显示单元格选定后的详细内容
//  Created by qinxin on 2023/4/28.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    //图片内容
    var imageName:String?
    //详细的文本内容
    var detailText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景颜色
        view.backgroundColor = .white
        
        //创建一张图片
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0

        let detailImage = UIImageView()
        detailImage.image = UIImage(named: imageName!)
        
        //设置圆角
        detailImage.layer.cornerRadius = 10
        detailImage.clipsToBounds = true
        view.addSubview(detailImage)
        
        //取消自动设置约束
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        
        //设置图片约束
        detailImage.snp.makeConstraints{ (make) in
            make.height.equalTo(250)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(0)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)

        }
        
        //创建一个文本
        let detailLabel = UILabel()
        
        //将文本内容设置为详细的文本内容
        detailLabel.text = detailText
        

        //将标签的行数设置为0，以允许文本在标签中自动换行
        detailLabel.numberOfLines = 0
        
        view.addSubview(detailLabel)
        
        //取消自动约束
        detailLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        //设置文本约束
        detailLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(detailImage.snp.bottomMargin).offset(20)
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10)
        }
    }
}
