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

    static let main = AppCoodinator()

    private var window: UIWindow = {
        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        return window
    }()

    init() {
        let navigation = UINavigationController()
        super.init(presenter: navigation)
    }

    override func start() {
        startFromResume()
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }

    func startFromResume() {
        let coordinator = ResumeCoordinator(presenter: presenter)
        add(child: coordinator)
        coordinator.start()
    }

    func startFromSplash() {
        let coordinator = SplashCoordinator(presenter: presenter)
        add(child: coordinator)
        coordinator.start()
    }

    func startFromMap() {
        let coordinator = MapCoordinator(presenter: presenter)
        add(child: coordinator)
        coordinator.start()
    }

}
