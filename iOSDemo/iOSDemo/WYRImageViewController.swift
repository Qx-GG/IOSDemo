//
//  ImageViewController.swift
//  Demo
//
//  Created by Wyr on 2023/4/25.
//
import UIKit

class image_one: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label:UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 50))
        label.text = "image_one"
        label.center = view.center
        view.addSubview(label)
    }
}

class image_two: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label:UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 50))
        label.text = "image_two"
        label.center = view.center
        view.addSubview(label)
    }
}

class image_three: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label:UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 50))
        label.text = "image_three"
        label.center = view.center
        view.addSubview(label)
    }
}

class image_four: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let label:UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 100, height: 50))
        label.text = "image_four"
        label.center = view.center
        view.addSubview(label)
    }
}
