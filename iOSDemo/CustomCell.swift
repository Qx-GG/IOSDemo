//
//  CustomCell.swift
//  Demo
//
//  Created by Wyr on 2023/4/27.
//
import UIKit

// 定义单元格
class CustomCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var imageView: UIImageView!
    var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.width))
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: frame.width, width: frame.width, height: frame.height - frame.width))
        titleLabel.textAlignment = .center
        let titleColor = hexStringToUIColor(hex:"#2a6e3f",alpha: 1)
        titleLabel.textColor = titleColor
        contentView.addSubview(titleLabel)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(tapGesture)
        
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageTapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        titleLabel.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: frame.height - frame.width)
    }
    
    func configure(withTitle title: String, image: UIImage?, index: Int) {
        self.titleLabel.text = title
        self.imageView.image = image
        // print("image\(index)")
        self.index = index
    }
    
    @objc func labelTapped() {
        let alertController = UIAlertController(title: "标签", message: "您点击了标签 \(index)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        if let viewController = self.window?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
           }
        // print("Label \(index)")
    }
}
