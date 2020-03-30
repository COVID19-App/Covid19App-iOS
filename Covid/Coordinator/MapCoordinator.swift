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

    override func start() {
        navigation?.setNavigationBarHidden(true, animated: false)
        let controller: MapViewController = .instantiate()
        navigation?.pushViewController(controller, animated: false)
    }

}

