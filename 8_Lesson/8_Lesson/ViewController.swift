//
//  ViewController.swift
//  8_Lesson
//
//  Created by Evgeny Mastepan on 11.07.2025.
//

import UIKit

final class ViewController: UIViewController {
    private var collectionView: UICollectionView!
    var items: [WaterfallData] = WaterfallData.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Определяем реальное соотношение сторон картинок ДО формирования коллекции.
        items = WaterfallData.calculateAspectRatios(for: items)
        setupCollectionView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            // Принудительно обновляем layout
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: WaterfallData.cellName)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Важно для Auto Layout
        view.addSubview(collectionView)
        
        // Привязываем к safeArea
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
