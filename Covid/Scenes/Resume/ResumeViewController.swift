//
//  ResumeViewController.swift
//  Covid
//
//  Created by Cristian Palomino on 3/26/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {

    weak var coodinator: Coordinator?

    private var sections: [Section] = [HeaderSection(),
                                       MiniCardSection(count: 3),
                                       HeaderSection(),
                                       MiniCardSection(count: 5),
                                       CardSection(),
                                       HeaderSection(),
                                       CardSection()]
    var collection: UICollectionView
    var layout: ([Section]) -> UICollectionViewCompositionalLayout

    init() {
        layout = { sections in
            return UICollectionViewCompositionalLayout { (section, layout) in
                return sections[section].defineLayout()
            }
        }
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout(sections))
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        register()
    }

    func prepare() {
        view.backgroundColor = .white
        collection.frame = view.frame
        collection.backgroundColor = .clear
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collection)
        collection.dataSource = self
    }

    func register() {
        collection.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.identifier)
        collection.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        collection.register(MiniCardCell.self, forCellWithReuseIdentifier: MiniCardCell.identifier)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        self.preferredContentSize = CGSize(width: view.bounds.width, height: (view.bounds.width * 0.33) + 64)
//        self.preferredContentSize = CGSize(width: view.bounds.width,
//                                           height:  collection.collectionViewLayout.collectionViewContentSize.height)
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
