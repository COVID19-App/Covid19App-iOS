//
//  Sections.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

protocol Section {

    var count: Int { get set }

    func defineLayout() -> NSCollectionLayoutSection
    func defineCell(collection: UICollectionView, index: IndexPath) -> UICollectionViewCell

}
