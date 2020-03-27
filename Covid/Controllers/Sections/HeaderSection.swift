//
//  HeaderSection.swift
//  Covid
//
//  Created by Cristian Palomino on 3/27/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import Foundation
import UIKit

struct HeaderSection: Section {

    var count: Int = 1

    func defineLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .small, leading: .zero, bottom: .zero, trailing: .zero)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(58))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: .small, bottom: .zero, trailing: .small)
        return section
    }

    func defineCell(collection: UICollectionView, index: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: index) as! HeaderCell
        let model = HeaderCell.Model(title: "Some")
        cell.prepare(with: model)
        return cell
    }

}
