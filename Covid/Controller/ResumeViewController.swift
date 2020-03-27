//
//  ResumeViewController.swift
//  Covid
//
//  Created by Cristian Palomino on 3/26/20.
//  Copyright © 2020 Cristian Palomino. All rights reserved.
//

import UIKit

typealias Spacing = CGFloat

extension UIView {

    func fixOnParent() {
        guard let parent = superview else { return }
        let constraints = [
            leftAnchor.constraint(equalTo: parent.leftAnchor),
            rightAnchor.constraint(equalTo: parent.rightAnchor),
            topAnchor.constraint(equalTo: parent.topAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension Spacing {

    static let zero: CGFloat = 0.0

    static let small: CGFloat = 8.0
    static let medium: CGFloat = small * 2
    static let big: CGFloat = small * 3

}

protocol Section {

    var count: Int { get set }

    func defineLayout() -> NSCollectionLayoutSection
    func defineCell(collection: UICollectionView, index: IndexPath) -> UICollectionViewCell

}

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

struct CardSection: Section {

    var count: Int = 1

    func defineLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .small, leading: .zero, bottom: .zero, trailing: .zero)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: .small, bottom: .zero, trailing: .small)
        return section
    }

    func defineCell(collection: UICollectionView, index: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: index) as! CardCell
        let model = CardCell.Model(title: "Some")
        cell.prepare(with: model)
        return cell
    }

}

struct MiniCardSection: Section {

    var count: Int

    func defineLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .small, leading: .small, bottom: .zero, trailing: .zero)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(0.2))
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

class HeaderCell: UICollectionViewCell {

    static var identifier: String = String(describing: HeaderCell.self)

    struct Model {

        let title: String

    }

    var shouldUpdateConstraints: Bool = true

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepare(with model: HeaderCell.Model) {
        backgroundColor = .black
    }

}

class CardCell: UICollectionViewCell {

    static var identifier: String = String(describing: CardCell.self)

    struct Model {

        let title: String

    }

    var shouldUpdateConstraints: Bool = true

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepare(with model: CardCell.Model) {
        backgroundColor = .black
    }

}

class MiniCardCell: UICollectionViewCell {

    static var identifier: String = String(describing: MiniCardCell.self)

    struct Model {

        let title: String

    }

    var shouldUpdateConstraints: Bool = true

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepare(with model: MiniCardCell.Model) {
        backgroundColor = .black
    }

}

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
