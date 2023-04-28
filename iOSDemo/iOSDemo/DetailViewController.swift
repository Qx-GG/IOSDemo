//
//  DetailViewController.swift
//  SecondDemo
//  DetailViewController类用于显示单元格选定后的详细内容
//  Created by qinxin on 2023/4/28.
//

import UIKit

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

        let detailImage = UIImageView(frame: CGRect(x: 0, y: navBarHeight+50, width: view.bounds.width, height: 200))
        detailImage.image = UIImage(named: imageName!)
        
        //设置圆角
        detailImage.layer.cornerRadius = 10
        detailImage.clipsToBounds = true
        view.addSubview(detailImage)
        
        //创建一个文本
        let detailLabel = UILabel(frame: CGRectMake(0, navBarHeight+50+200+10, UIScreen.main.bounds.width, 100))
        
        //将文本内容设置为详细的文本内容
        detailLabel.text = detailText
        

        //将标签的行数设置为0，以允许文本在标签中自动换行
        detailLabel.numberOfLines = 0
        
        view.addSubview(detailLabel)
        
//            //取消自动设置约束
//            detailLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            //开启手动设置的约束
//            detailLabel.snp.makeConstraints { (make) -> Void in
//                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(0)
//                make.left.equalTo(view.safeAreaLayoutGuide.snp.leftMargin).offset(0)
//                make.right.equalTo(view.safeAreaLayoutGuide.snp.rightMargin).offset(10)
//            }
    }
}
