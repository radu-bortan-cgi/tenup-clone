//
//  AdvantageCard.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class AdvantageCard: UIView {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init(data: Advantage) {
        super.init(frame: .zero)
        setupUI()
        configure(with: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented!")
    }

    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        textStack.axis = .vertical
        textStack.spacing = 8
        textStack.alignment = .leading
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(textStack)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            
            textStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            textStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            textStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with data: Advantage) {
        guard let imageUrl = URL(string: data.photoURL) else {
            return
        }
        
        // ??? Ca marche pas...
        DispatchQueue.global().async { [weak self] in
          
            guard let self = self else { return }

            guard let imageData = try? Data(contentsOf: imageUrl) else {
              return
            }

            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.imageView.image = image
            }
        }

        nameLabel.text = data.name
        descriptionLabel.text = data.description
    }
}
