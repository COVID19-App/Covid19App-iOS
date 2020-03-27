//
//  Coordinator.swift
//  Covid
//
//  Created by Cristian Palomino on 3/26/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {

    var navigation: UINavigationController? { get }
    var presenter: UIViewController? { get set }

    var parent: Coordinator? { get set }
    var children: [Coordinator] { get set }

    func start()

    func add(child: Coordinator)
    func remove(child: Coordinator)

}

extension Coordinator {

    var navigation: UINavigationController? {
        return presenter as? UINavigationController
    }

    func add(child: Coordinator) {
        children.append(child)
    }

    func remove(child: Coordinator) {
        children.removeAll { $0 === child }
    }

}
