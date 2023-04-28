import UIKit
import JJKit
import Combine

class RotationMapViewController: UIViewController , UICollectionViewDataSource,
    UICollectionViewDelegate {
    
    let imageNames = ["image_1", "image_2", "image_3","image_4"]
    var carouselView: JJCarouselView<UIImageView, UIImage>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 轮播图
        carouselView = JJCarouselView(frame: CGRect(x:10 , y: UIScreen.main.bounds.width/5, width: UIScreen.main.bounds.width-20, height: (UIScreen.main.bounds.width)/2)) {
            print(UIScreen.main.bounds.width)
            return UIImageView()
        }
        
        carouselView.layer.cornerRadius = 10
        carouselView.layer.masksToBounds = true
        carouselView.config.direction = .ltr
        carouselView.config.autoLoop = true
        carouselView.config.loopTimeInterval = 2
        carouselView.config.contentInset = .zero
        carouselView.config.display = { imageView, image in
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.image = image
        }
        
        var images = [UIImage]()
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                images.append(image)
            }
        }
        carouselView.datas = images
        
        self.view.backgroundColor = UIColor.white

        carouselView.event.onTap = {view , images , index in
            print("check image!!\(index+1)")
            self.GO2Image(index+1)
        }
        
        view.addSubview(carouselView)

        // 设置按键布局
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.bounds.width / 10, height: view.bounds.height / 15)
        layout.minimumLineSpacing = view.bounds.width / 8
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom:5, right: 0)
        
        // 创建UICollectionView
        collectionView = UICollectionView(frame: CGRect(x: 0, y: view.bounds.height*13/40, width: view.bounds.width, height: view.bounds.height/6), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        // 注册自定义单元格
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        // 设置数据源代理
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        view.addSubview(collectionView)
        
        // 添加音乐子视图
        let albumVC = childViewController(1)
        albumVC.view.frame = CGRect(x: 3, y: view.bounds.height*21/40, width: view.bounds.width, height:150)
        self.addChild(albumVC)
        self.view.addSubview(albumVC.view)
        albumVC.didMove(toParent: self)
        
        //添加电影子视图
        let movieVc = childViewController(2)
        movieVc.view.frame = CGRect(x: 0, y: view.bounds.height*30/40, width: view.bounds.width, height: 150)
        self.addChild(movieVc)
        self.view.addSubview(movieVc.view)
        movieVc.didMove(toParent: self)
        
        // 添加电影标签容器
        let movieContainer = UIView(frame: CGRect(x: 2, y: view.bounds.height*28/40, width: view.bounds.width-4, height: 25))
        movieContainer.layer.cornerRadius = 10
        movieContainer.backgroundColor = UIColor(red: 0.549, green: 0.314, blue: 0.173, alpha: 1)
        view.addSubview(movieContainer)

        // 添加电影标签
        let movieLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 25))
        movieLabel.text = "电影"
        movieLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        let movieColor = hexStringToUIColor(hex:"#9ebc19",alpha: 1)
        movieLabel.textColor = movieColor
        movieContainer.addSubview(movieLabel)

        // 添加音乐标签容器
        let musicContainer = UIView(frame: CGRect(x: 2, y: view.bounds.height*20/40, width: view.bounds.width-4, height: 25))
        musicContainer.layer.cornerRadius = 10
        musicContainer.backgroundColor = UIColor(red: 0.549, green: 0.314, blue: 0.173, alpha: 1)
        view.addSubview(musicContainer)

        // 添加音乐标签
        let musicLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 25))
        musicLabel.text = "音乐"
        musicLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        let musicColor = hexStringToUIColor(hex:"#9ebc19",alpha: 1)
        musicLabel.textColor = musicColor
        musicContainer.addSubview(musicLabel)

        
    }
    
    @objc private func GO2Image(_ image_num:Int ){
        switch image_num{
        case 1:
            let StartView = image_one()
            navigationController?.pushViewController(StartView, animated: true)
        case 2:
            let StartView = image_two()
            navigationController?.pushViewController(StartView, animated: true)
        case 3:
            let StartView = image_three()
            navigationController?.pushViewController(StartView, animated: true)
        case 4:
            let StartView = image_four()
            navigationController?.pushViewController(StartView, animated: true)
        default:
            print("Wrong")
        }
    }
    
    // 协议 返回 section 中单元格个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16 // 假设有16个按键
    }

    // 协议 返回创建的单元格对象
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            cell.titleLabel.text = "\(indexPath.item + 1)" // 显示按键的编号
            cell.index = indexPath.item + 1 // 保存单元格的编号
        let image = UIImage(named: "image\(indexPath.item + 1)")
        cell.configure(withTitle: "\(indexPath.item + 1)", image: image, index: indexPath.item + 1 )
            return cell
    }
}
