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
        
        let item = items[indexPath.row]
        let padding: CGFloat = 32 // Отступы 16pt с каждой стороны
        let width = collectionView.bounds.width - padding
        
        // Временная метка для расчета высоты текста
        let tempLabel = UILabel()
        tempLabel.numberOfLines = 0
        tempLabel.font = .systemFont(ofSize: 16)
        tempLabel.text = item.description
        let textHeight = tempLabel.sizeThatFits(
            CGSize(width: width, height: .infinity)
        ).height
        
        // Высота изображения (75% от ширины)
        let imageHeight = width * 0.75
        
        // Общая высота: изображение + текст + отступы
        let totalHeight = imageHeight + textHeight + 24 // 24 = 8 (spacing) + 16 (доп. отступ)
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let item = items[indexPath.row]
        
        cell.configure(
            image: UIImage(named: item.image),
            text: item.description ?? ""
        )
        
        return cell
    }
}
