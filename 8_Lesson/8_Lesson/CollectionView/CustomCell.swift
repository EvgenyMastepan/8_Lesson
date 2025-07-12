//
//  CustomCell.swift
//  8_Lesson
//
//  Created by Evgeny Mastepan on 11.07.2025.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    private let titul = UILabel()
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
        titul.font = .systemFont(ofSize: 16, weight: .black)
        titul.textColor = .waterBlue
        titul.setContentCompressionResistancePriority(.required, for: .vertical)
        
        // Настройка изображения
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .cellBackground
        
        // Настройка текста
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        
        // Верстка
        let stack1 = UIStackView(arrangedSubviews: [imageView, label])
        stack1.axis = .vertical
        stack1.spacing = 5
        let stackView = UIStackView(arrangedSubviews: [titul, stack1])
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])

    }
    func configure(title: String, image: UIImage?, text: String) {
        titul.text = title
        imageView.image = image
        label.text = text
    }
}
