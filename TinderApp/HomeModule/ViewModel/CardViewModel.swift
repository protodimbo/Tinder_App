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
struct CardViewModel {
    let imageName: String
    let attributedString: NSAttributedString
    let textAligment: NSTextAlignment
}
