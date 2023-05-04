import UIKit

class childViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let type:Int
    let reuseIdentifier = "PhotoCell"
    var photos:[String]
    var collectionView: UICollectionView!

    init(_ type: Int) {
        // 1->music 2->movie
        self.type = type
        if(type == 1){
            self.photos = ["album1","album2","album3","album4","album5"]
        }else{
            self.photos = ["movie1","movie2","movie3","movie4","movie5"]
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.bounds.width*7/25, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = view.bounds.width/30
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true // 开启分页效果
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        
    }
    
    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let curImage = UIImage(named: photos[indexPath.row])
        let imageView = UIImageView(image: curImage)
        imageView.frame = cell.contentView.bounds
        imageView.contentMode = .scaleAspectFit
        cell.contentView.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        imageView.addGestureRecognizer(tap)
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: collectionView)
        if let indexPath = self.collectionView.indexPathForItem(at: tapLocation) {
            print(indexPath)
            let imageVc = curPhoto(type)
            imageVc.image = UIImage(named: photos[indexPath.row])
            self.present(imageVc, animated: true, completion: nil)
        }
    }

}

class curPhoto: UIViewController {

    var image:UIImage?
    let type:Int
    
    init(_ type:Int){
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        let curImageView = UIImageView(image: image)
        if(type == 1){
            curImageView.frame = CGRect(x: 0, y: view.bounds.height/5, width: view.bounds.width, height: view.bounds.width)
        }else {
            curImageView.frame = CGRect(x: 20, y: view.bounds.height/8, width: view.bounds.width-40, height: view.bounds.width*4/3)
        }
        
        view.addSubview(curImageView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
           self.dismiss(animated: true, completion: nil)
       }
}
