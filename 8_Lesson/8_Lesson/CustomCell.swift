//
//  CustomCell.swift
//  8_Lesson
//
//  Created by Evgeny Mastepan on 11.07.2025.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Настройка изображения
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        
        // Настройка текста
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        
        // Верстка
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Фиксированная высота изображения (соотношение сторон сохранится)
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75)
        ])

    }
    func configure(image: UIImage?, text: String) {
        imageView.image = image
        label.text = text
        
        // Корректировка соотношения сторон для вертикальных/горизонтальных изображений
        if let image = image {
            let aspectRatio = image.size.height / image.size.width
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                             multiplier: aspectRatio).isActive = true
        }
    }
}
