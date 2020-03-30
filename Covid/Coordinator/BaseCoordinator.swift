//
//  BaseCoordinator.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

open class BaseCoordinator: Coordinator {

    var presenter: UIViewController?

    var delegate: CoordinatorDelegate?

    var parent: Coordinator?
    var children: [Coordinator] = []

    init(presenter: UIViewController?) {
        self.presenter = presenter
    }

    convenience init() {
        let navigation = UINavigationController()
        self.init(presenter: navigation)
    }

    func start() { }

}
