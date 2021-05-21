//
//  CardView.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class CardView: UIView {
    // MARK: - Private Properties

    private let imageView = UIImageView(image: UIImage(named: "lady5c"))

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true

        addSubview(imageView)
        imageView.fillSuperview()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func endedAnimation() {
        UIView.animate(
            withDuration: 0.75,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.1,
            options: .curveEaseOut,
            animations: {
                self.transform = .identity
            }
        )
    }

    private func handleChange(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }

    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChange(gesture)
        case .ended:
            endedAnimation()
        default:
            return
        }
    }
}
