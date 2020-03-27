//
//  MapCoordinator.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

final class MapCoordinator: BaseCoordinator {

    override init(presenter: UIViewController?) {
        super.init(presenter: presenter)
    }

    override func start() {
        let controller = ResumeViewController()
        navigation?.pushViewController(controller, animated: false)
    }

}

