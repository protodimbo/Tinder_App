//
//  HomeController.swift
//  TinderApp
//
//  Created by  protodimbo on 21.05.2021.
//

import UIKit

final class HomeController: UIViewController {
    // MARK: - Visual Components

    private let topStackView: HomeTopNavigationStackView = {
        let stackView = HomeTopNavigationStackView()
        return stackView
    }()

    private let cardsDeckView: UIView = {
        let view = UIView()
        return view
    }()

    private let bottomStackView: HomeBottomControlsStackView = {
        let stackView = HomeBottomControlsStackView()
        return stackView
    }()

    // MARK: - Private Properties

    let users = [
        User(name: "Ann", age: 24, profession: "Actress", imageName: "lady5c"),
        User(name: "Jane", age: 18, profession: "Music DJ", imageName: "lady6c")
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCards()
    }

    // MARK: - Private Methods

    private func setupLayout() {
        let overallStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, bottomStackView])
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
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

    private func setupDummyCards() {
        users.forEach { user in
            let cardView = CardView()
            cardView.configureCard(
                imageName: user.imageName,
                name: user.name,
                age: user.age,
                profession: user.profession
            )
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
}
