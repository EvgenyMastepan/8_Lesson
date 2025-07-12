//
//  Extension.swift
//  8_Lesson
//
//  Created by Evgeny Mastepan on 11.07.2025.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = items[indexPath.item]
        let padding: CGFloat = 16 // По уму можно сделать структуру со всеми глобальными переменными.
        let width = collectionView.bounds.width - (padding * 2)
        
        // 1. Высота изображения (берём aspect)
        let imageHeight = width * (item.aspect ?? 1)
        
        // 2. Высота текста для предварительного расчёта.
        let textHeight: CGFloat = item.description.isEmpty == false ? 50 : 0 // Примерная высота
        let titulHeight: CGFloat = item.title.isEmpty == false ? 20 : 0
        
        // 3. Общая высота
        let totalHeight = titulHeight + imageHeight + textHeight + 8 // + отступ
        
        return CGSize(width: width, height: totalHeight)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterfallData.cellName, for: indexPath) as! CustomCell
        let item = items[indexPath.row]
        
        cell.configure(
            title: item.title,
            image: UIImage(named: item.image),
            text: item.description
        )
        
        return cell
    }
}
