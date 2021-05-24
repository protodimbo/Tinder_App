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

    private let cardViewModels: [CardViewModel] = {
        let producers = [
            Advertiser(title: "Check my Github", brandName: "@protodimbo", posterPhotoName: "advertiser"),
            User(name: "Ana", age: 24, profession: "Actress", imageNames: ["ana1", "ana2", "ana3"]),
            User(name: "Kelly", age: 18, profession: "Music DJ", imageNames: ["kelly1", "kelly2", "kelly3"]),
            User(name: "Jane", age: 23, profession: "Photographer", imageNames: ["jane1", "jane2", "jane3"])
        ] as [ProducesCardViewModel]

        let viewModels = producers.map { $0.toCardViewModel() }
        return viewModels
    }()

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
        cardViewModels.forEach { cardViewModel in
            let cardView = CardView()
            cardView.cardViewModel = cardViewModel
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
}
