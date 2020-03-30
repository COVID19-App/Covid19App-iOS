//
//  SplashViewController.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController {

    weak var coodinator: Coordinator?

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }

    private func prepare() {
        titleLabel.text = Localizable.from(file: "Splash")("Title")
        descriptionLabel.text = Localizable.from(file: "Splash")("Description")
    }

}

extension SplashViewController {

    func startTimer() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async { [weak self] in
                self?.coodinator?.finish()
            }
        }
    }

}
