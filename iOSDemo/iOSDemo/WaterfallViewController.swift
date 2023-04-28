//
//  ViewController.swift
//  SecondDemo
//  瀑布流视图
//  Created by qinxin on 2023/4/26.
//

import UIKit


class WaterfallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var collectionView: UICollectionView!
    
    //重用标识符
    let reuseIdentifier = "Cell"
    
    //文本数据源
    var dataArray = [String]();
    
    //图片数据源
    var imageArray = [String]();

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 读取文本文件
        guard let url = Bundle.main.url(forResource: "file", withExtension: "txt") else {
            fatalError("找不到文件捏")
        }
        do{
            let data = try String(contentsOf: url, encoding: .utf8) // 读取文件内容
            dataArray = data.components(separatedBy: .newlines) // 将每行数据分割成数组
            if dataArray[dataArray.count-1] == ""{
                dataArray.removeLast()
            }
        }catch{
            print(error);
        }
        
        // 读取图片文件
        guard let url = Bundle.main.url(forResource: "image", withExtension: "txt") else {
            fatalError("找不到文件捏")
        }
        do{
            let data = try String(contentsOf: url, encoding: .utf8) // 读取文件内容
            imageArray = data.components(separatedBy: .newlines) // 将每行数据分割成数组
            if imageArray[imageArray.count-1] == ""{
                imageArray.removeLast()
            }
        }catch{
            print(error);
        }
        
        
        // 初始化瀑布流布局
        let layout = WaterfallLayout()
        layout.delegate = self;
        layout.scrollDirection = .vertical;
        
        // 初始化collectionView
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        //设置collectionView的背景颜色为白色
        collectionView.backgroundColor = .white
        
        //设置collectionView的数据源和代理
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        //将自定义的单元格WaterfallCell注册到collectionView中，并设置重用标识符reuseIdentifier，代表该单元格可重用，如果重用池没有课重用的单元格，就新建一个单元格，并设置重用标识符
        collectionView.register(WaterfallCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //主视图添加collectionView视图
        view.addSubview(collectionView)
        
        // 添加长按手势识别器
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
            self.collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            // 获取长按的位置
            let point = gesture.location(in: collectionView)

            // 获取长按位置所在的单元格indexPath
            if let indexPath = self.collectionView.indexPathForItem(at: point) {
                // 跳转到新的界面并显示图片
                let imageVC = ImageViewController()
                imageVC.image = UIImage(named:imageArray[indexPath.row]);
                self.present(imageVC, animated: true, completion: nil)
            }
        }
    }
    
    
    // 返回单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count;
    }
        
    // 返回指定位置的单元格
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WaterfallCell
        cell.imageView.frame = CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height - 50)
        cell.imageView.image = UIImage(named:imageArray[indexPath.row]);
        
        cell.summaryLabel.frame = CGRect(x: 0, y: cell.bounds.height - 50, width: cell.bounds.width, height: 50)
        cell.summaryLabel.text = dataArray[indexPath.row];
        return cell
    }
        
    // 点击单元格时跳转到详情页
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //获取被选中的单元格
        let cell = collectionView.cellForItem(at: indexPath) as! WaterfallCell
        
        // 执行缩放动画
        UIView.animate(withDuration: 0.2, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: { finished in
                // 跳转到下一个视图控制器
                let detailViewController = DetailViewController();
                
                detailViewController.title = "详情页\(indexPath.row)"
                //设置详细文本
                detailViewController.detailText = self.dataArray[indexPath.row]
                //设置图片名字
                detailViewController.imageName = self.imageArray[indexPath.row]
                
                self.navigationController?.pushViewController(detailViewController, animated: true)
                
                // 恢复单元格的原始状态
                cell.transform = CGAffineTransform.identity
            })
    }

}










