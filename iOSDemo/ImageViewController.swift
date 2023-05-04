//
//  ImageViewController.swift
//  SecondDemo
//  长按图片后跳出的新的界面
//  Created by qinxin on 2023/4/28.
//

import UIKit

class ImageViewController: UIViewController {

    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加UIImageView
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = self.image
        self.view.addSubview(imageView)
        
        // 添加手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
            self.dismiss(animated: true, completion: nil)
        }
}
