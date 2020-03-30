//
//  AppCoordinator.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

final class AppCoodinator: BaseCoordinator {

    static let main = AppCoodinator(presenter: nil)

    var window: UIWindow = {
        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        return window
    }()

    override func start() {
        SplashCoordinator(app: self).start()
        window.makeKeyAndVisible()
    }

}

extension AppCoodinator: CoordinatorDelegate {

    func didFinish(coordinator: Coordinator) {
        if coordinator is SplashCoordinator { MapCoordinator(app: self).start() }
    }

}

private extension BaseCoordinator {

    convenience init<T>(parent: T) where T: Coordinator, T: CoordinatorDelegate {
        self.init()
        self.parent = parent
        self.delegate = parent
        parent.add(child: self)
    }

    convenience init(app: AppCoodinator) {
        self.init(parent: app)
        app.window.rootViewController = self.presenter
    }

}
