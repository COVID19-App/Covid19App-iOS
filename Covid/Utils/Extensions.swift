//
//  Extensions.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func fixOnParent() {
        guard let parent = superview else { return }
        let constraints = [
            leftAnchor.constraint(equalTo: parent.leftAnchor),
            rightAnchor.constraint(equalTo: parent.rightAnchor),
            topAnchor.constraint(equalTo: parent.topAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension Spacing {

    static let zero: CGFloat = 0.0

    static let small: CGFloat = 8.0
    static let medium: CGFloat = small * 2
    static let big: CGFloat = small * 3

}
