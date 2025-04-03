//
//  AdvantagesViewController.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class AdvantagesViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blueBackground
        
        navigationItem.title = nil
        
        setupUI()
        populateCards()
    }
    

    private func setupUI() {
        titleLabel.text = "Profitez d'avantages licenciés exclusifs"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textColor = .yellow
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        let contentLabel = UILabel()
        contentLabel.text = "Actuellement"
        contentLabel.font = UIFont.systemFont(ofSize: 18)
        contentLabel.textAlignment = .left
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentStack.addArrangedSubview(contentLabel)
        
        view.addSubview(titleLabel)
        scrollView.addSubview(contentStack)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
    
    private func populateCards() {
        let advantages: [Advantage] = [
            Advantage(photoURL: "https://placehold.co/200x100", name: "Hertz", description: "Jusqu'à 15% de remise en France et en Europe"),
            Advantage(photoURL: "https://placehold.co/200x100", name: "Offre Accor Licenciés FFT", description: "Jusqu'à -9% sur 4300 hotels Accor"),
            Advantage(photoURL: "https://placehold.co/200x100", name: "Disneyland Paris", description: "Réduction sur l'offre billeterie toute l'année"),
            Advantage(photoURL: "https://placehold.co/200x100", name: "INTERSPORT", description: "-2% sur bipack Elite Wilson")
        ]
        
        for data in advantages {
            let advantageCard = AdvantageCard(data: data)
            contentStack.addArrangedSubview(advantageCard)
            
            advantageCard.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                advantageCard.heightAnchor.constraint(equalToConstant: 150)
            ])
        }
    }

}
