//
//  CardViewModel.swift
//  TinderApp
//
//  Created by  protodimbo on 22.05.2021.
//

import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

/// Our card viewModel
final class CardViewModel {
    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAligment: NSTextAlignment

    private var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named: imageName)
            imageIndexObserver?(imageIndex, image)
        }
    }

    // Reactive Programming
    var imageIndexObserver: ((Int, UIImage?) -> ())?

    init(imageNames: [String], attributedString: NSAttributedString, textAligment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributedString = attributedString
        self.textAligment = textAligment
    }

    func advanceToNextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }

    func goToPreviousPhoto() {
        imageIndex = max(0, imageIndex - 1)
    }
}
