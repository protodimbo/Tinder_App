//
//  HomeTopNavigationStackView.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class HomeTopNavigationStackView: UIStackView {
    // MARK: - Private Properties

    private let topSubview = [
        UIImage(named: "top_left_profile"),
        UIImage(named: "app_icon"),
        UIImage(named: "top_right_message")
    ].map { image -> UIView in
        let button = UIButton(type: .system)
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 16, right: 16)
        topSubview.forEach { addArrangedSubview($0) }
        heightAnchor.constraint(equalToConstant: 70).isActive = true
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
