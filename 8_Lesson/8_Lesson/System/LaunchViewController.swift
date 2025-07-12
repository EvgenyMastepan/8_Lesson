//
//  LaunchViewController.swift
//  8_Lesson
//
//  Created by Evgeny Mastepan on 12.07.2025.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        $0.text = "Водопады Алтайского края"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = .waterBlue
        $0.textAlignment = .center
        $0.alpha = 0
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var waterfallImage: UIImageView = {
        $0.image = UIImage(named: "waterfall")
        $0.contentMode = .scaleAspectFit
        $0.alpha = 0
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startAnimations()
    }
    
    private func setupUI() {
        view.backgroundColor = .cellBackground
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.cellBackground, UIColor.white.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
        UIView.animate(withDuration: 2.0, delay: 0.8, options: [.curveEaseOut], animations: {
            self.waterfallImage.alpha = 1
            self.waterfallImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, waterfallImage])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            waterfallImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func startAnimations() {
        UIView.animate(withDuration: 1.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.titleLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 1.5, delay: 0.8, options: .curveEaseOut, animations: {
            self.waterfallImage.alpha = 1
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.transitionToMainScreen()
        }
    }
    
    private func transitionToMainScreen() {
        let mainVC = ViewController()
        let navController = UINavigationController(rootViewController: mainVC)
        navController.navigationBar.isHidden = true
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
        // Для старой версии xCode, у меня предыдущее не работало на старом макбуке.
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = navController
            }
            return
        }
        
        UIView.transition(
            with: window,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                window.rootViewController = navController
            },
            completion: nil
        )
    }
}
