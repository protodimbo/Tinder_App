//
//  ViewController.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let subviews = [UIColor.gray, UIColor.darkGray, UIColor.black].map { color -> UIView in
            let view = UIView()
            view.backgroundColor = color
            return view
        }
        let topStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: subviews)
            stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            stackView.distribution = .fillEqually
            return stackView
        }()

        let blueView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }()
        let yellowView: UIView = {
            let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 120).isActive = true
            view.backgroundColor = .yellow
            return view
        }()

        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [topStackView, blueView, yellowView])
            stackView.axis = .vertical
            return stackView
        }()
        view.addSubview(stackView)
        stackView.frame = .init(x: 0, y: 0, width: 300, height: 200)

        stackView.fillSuperview()
    }
}
