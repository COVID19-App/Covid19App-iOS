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

    var parent: Coordinator?

    var children: [Coordinator] = []

    init(presenter: UIViewController?) {
        self.presenter = presenter
    }

    func start() { }

}
