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
            topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor),
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

extension UIViewController {

    static func instantiate<T>() -> T {
        let name = NSStringFromClass(self).components(separatedBy: ".").last!.replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: self))
        guard let viewController = storyboard.instantiateInitialViewController() as? T else { fatalError() }
        return viewController
    }

}

extension Localizable {

    static func from(file: String) -> (String) -> String {
        return { key in
            return Bundle.main.localizedString(forKey: key, value: nil, table: file)
        }
    }

}
