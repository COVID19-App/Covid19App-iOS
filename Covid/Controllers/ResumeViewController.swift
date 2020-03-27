//
//  ResumeViewController.swift
//  Covid
//
//  Created by Cristian Palomino on 3/26/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {

    private var sections: [Section] = [HeaderSection(),
                                       MiniCardSection(count: 3),
                                       HeaderSection(),
                                       MiniCardSection(count: 5),
                                       CardSection(),
                                       HeaderSection(),
                                       CardSection()]
    private var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        register()
    }

    func prepare() {
        view.backgroundColor = .white
        collection = UICollectionView(frame: .zero, collectionViewLayout:
            UICollectionViewCompositionalLayout { [weak self] (section, layout) in
                return self?.sections[section].defineLayout()
        })
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collection)
        collection.fixOnParent()
        collection.dataSource = self
    }

    func register() {
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.identifier)
        collection.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        collection.register(MiniCardCell.self, forCellWithReuseIdentifier: MiniCardCell.identifier)
    }

}

extension ResumeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        return section.defineCell(collection: collectionView, index: indexPath)
    }

}
