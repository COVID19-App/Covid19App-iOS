//
//  MiniCardSection.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

struct MiniCardSection: Section {

    var count: Int

    func defineLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .small, leading: .small, bottom: .zero, trailing: .zero)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .small)
        return section
    }

    func defineCell(collection: UICollectionView, index: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: MiniCardCell.identifier, for: index) as! MiniCardCell
        let model = MiniCardCell.Model(title: "Some")
        cell.prepare(with: model)
        return cell
    }

}
