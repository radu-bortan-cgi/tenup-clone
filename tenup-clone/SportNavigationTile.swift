//
//  SportNavigationTile.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class SportNavigationTile: UIView {
    var onTap: (() -> Void)?

    init(imageName: String, text: String) {
        super.init(frame: .zero)
        setupView(imageName: imageName, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented!")
    }
    
    private func setupView(imageName: String, text: String) {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let imageContainer = UIView()
        imageContainer.backgroundColor = .blueBackground
        imageContainer.layer.cornerRadius = 8
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(imageView)
        
        let label = UILabel()
        label.text = text
        label.textColor = .blueBackground
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowIcon = UIImageView(image: UIImage(systemName: "arrow.forward"))
        arrowIcon.tintColor = .blueBackground
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tileTapped))
        self.addGestureRecognizer(tapGesture)
        
        self.addSubview(imageContainer)
        self.addSubview(label)
        self.addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            imageContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageContainer.widthAnchor.constraint(equalToConstant: 40),
            imageContainer.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: 10),
            
            arrowIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            arrowIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: 24),
            arrowIcon.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    @objc private func tileTapped() {
        onTap?()
    }
}
