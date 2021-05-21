//
//  CardView.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class CardView: UIView {
    // MARK: - Visual Components

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "lady5c"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Private Properties

    private let threshold: CGFloat = 100

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
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

    private func endedAnimation(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        UIView.animate(
            withDuration: 0.75,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.1,
            options: .curveEaseOut,
            animations: {
                if shouldDismissCard {
                    let hiddingView = CGAffineTransform(translationX: 1000 * translationDirection, y: 0)
                    self.transform = hiddingView
                } else {
                    self.transform = .identity
                }
            }, completion: { _ in
                guard let superview = self.superview else { return }
                self.transform = .identity
                self.frame = CGRect(x: 0, y: 0, width: superview.frame.width, height: superview.frame.height)
            }
        )
    }

    private func handleChange(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        // radians to degrees
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotationTranformation = CGAffineTransform(rotationAngle: angle)
        transform = rotationTranformation.translatedBy(x: translation.x, y: translation.y)
    }

    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChange(gesture)
        case .ended:
            endedAnimation(gesture)
        default:
            return
        }
    }
}
