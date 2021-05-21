//
//  HomeBottomControlsStackView.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class HomeBottomControlsStackView: UIStackView {
    // MARK: - Visual Comonents

    private let bottomSubview = [
        UIImage(named: "refresh_circle"),
        UIImage(named: "dismiss_circle"),
        UIImage(named: "super_like_circle"),
        UIImage(named: "like_circle"),
        UIImage(named: "boost_circle")
    ].map { image -> UIView in
        let button = UIButton(type: .system)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        bottomSubview.forEach { addArrangedSubview($0) }
        heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
