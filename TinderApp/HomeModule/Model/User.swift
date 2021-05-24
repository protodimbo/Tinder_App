//
//  User.swift
//  TinderApp
//
//  Created by  protodimbo on 22.05.2021.
//

import UIKit

/// User model
struct User: ProducesCardViewModel {
    let name: String
    let age: Int
    let profession: String
    let imageNames: [String]

    // Generate viewModel for cards
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(
            string: name,
            attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)]
        )
        attributedText
            .append(NSAttributedString(
                string: " \(age)",
                attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]
            ))
        attributedText
            .append(NSAttributedString(
                string: "\n\(profession)",
                attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]
            ))

        return CardViewModel(imageNames: imageNames, attributedString: attributedText, textAligment: .left)
    }
}
