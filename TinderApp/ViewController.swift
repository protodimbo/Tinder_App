//
//  ViewController.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Private Properties

    private let topStackView: HomeTopNavigationStackView = {
        let stackView = HomeTopNavigationStackView()
        return stackView
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private let bottomStackView: HomeBottomControlsStackView = {
        let stackView = HomeBottomControlsStackView()
        return stackView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - Private Methods

    private func setupLayout() {
        let overallStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [topStackView, blueView, bottomStackView])
            stackView.axis = .vertical
            return stackView
        }()
        view.addSubview(overallStackView)
        overallStackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.trailingAnchor
        )
    }
}
