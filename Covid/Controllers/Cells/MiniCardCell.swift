//
//  MiniCardCell.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

class MiniCardCell: UICollectionViewCell {

    static var identifier: String = String(describing: MiniCardCell.self)

    struct Model {

        let title: String

    }

    var shouldUpdateConstraints: Bool = true

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepare(with model: MiniCardCell.Model) {
        backgroundColor = .black
    }

}
