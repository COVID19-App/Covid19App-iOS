//
//  MapViewController.swift
//  Covid
//
//  Created by Cristian Palomino on 3/29/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialNavigationDrawer

final class MapViewController: UIViewController {

    let bottomDrawerTransitionController = MDCBottomDrawerTransitionController()
    let contentViewController = ResumeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let contentViewController = ResumeViewController()
//        contentViewController.transitioningDelegate = MDCBottomDrawerTransitionController()
//        contentViewController.modalPresentationStyle = .custom
//        present(contentViewController, animated: true, completion: nil)

//        let bottomDrawerViewController = MDCBottomDrawerViewController()
//        bottomDrawerViewController.contentViewController = ResumeViewController()
//        bottomDrawerViewController.modalPresentationStyle = .custom
//        present(bottomDrawerViewController, animated: true, completion: nil)

        let bottomDrawerViewController = MDCBottomDrawerViewController()
        bottomDrawerViewController.maximumInitialDrawerHeight = 200
        bottomDrawerViewController.dismissOnBackgroundTap = false
        bottomDrawerViewController.elevation = .cardResting
        bottomDrawerViewController.maximumInitialDrawerHeight = view.frame.height
        bottomDrawerViewController.contentViewController = self.contentViewController
        bottomDrawerViewController.trackingScrollView = self.contentViewController.collection
        self.present(bottomDrawerViewController, animated: true, completion: nil)

//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            bottomDrawerViewController.expandToFullscreen(withDuration: 2.0, completion: nil)
//        }

    }

}
