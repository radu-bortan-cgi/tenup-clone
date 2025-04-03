//
//  ViewController.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class SportSelectionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blueBackground
        
        let titleContainer = UIView()
        titleContainer.backgroundColor = .clear
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let tenupLabel = UILabel()
        tenupLabel.text = "TEN'UP"
        tenupLabel.textColor = .white
        tenupLabel.font = UIFont.boldSystemFont(ofSize: 32)
        tenupLabel.textAlignment = .center
        tenupLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let fftLabel = UILabel()
        fftLabel.text = "FEDERATION FRANCAISE DE TENNIS"
        fftLabel.textColor = .white
        fftLabel.font = UIFont.systemFont(ofSize: 8)
        fftLabel.textAlignment = .center
        fftLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let accountButton = UIButton(type: .system)
        let personIcon = UIImage(named: "PersonIcon")
        accountButton.setImage(personIcon, for: .normal)
        accountButton.tintColor = .white
        accountButton.imageView?.contentMode = .scaleAspectFit
        accountButton.translatesAutoresizingMaskIntoConstraints = false

        let separator = UIView()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false

        let navigationContainer = UIView()
        navigationContainer.backgroundColor = .white
        navigationContainer.layer.cornerRadius = 16
        navigationContainer.layer.masksToBounds = true
        navigationContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Choisissez votre sport"
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
                
        let tennisTile = SportNavigationTile(imageName: "RacketIcon", text: "TENNIS")
        let padelTile = SportNavigationTile(imageName: "RacketIcon", text: "PADEL")
        let beachTennisTile = SportNavigationTile(imageName: "RacketIcon", text: "BEACH TENNIS")
        let pickleBallTile = SportNavigationTile(imageName: "RacketIcon", text: "PICKLE BALL")
        
        tennisTile.onTap = {
            print("LOL!")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: MainTabBarControllerViewController()) }
        
        let navigationTileList = UIStackView(arrangedSubviews: [tennisTile, padelTile, beachTennisTile, pickleBallTile])
        navigationTileList.axis = .vertical
        navigationTileList.spacing = 20
        navigationTileList.distribution = .fillEqually
        navigationTileList.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleContainer)
        
        titleContainer.addSubview(tenupLabel)
        titleContainer.addSubview(fftLabel)

        view.addSubview(accountButton)
        view.addSubview(separator)
        view.addSubview(navigationContainer)

        navigationContainer.addSubview(titleLabel)
        navigationContainer.addSubview(navigationTileList)
        
        NSLayoutConstraint.activate([
            titleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            tenupLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            tenupLabel.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor),
            
            fftLabel.topAnchor.constraint(equalTo: tenupLabel.bottomAnchor, constant: 2),
            fftLabel.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor),
            fftLabel.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            
            accountButton.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            accountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            accountButton.widthAnchor.constraint(equalToConstant: 24),
            accountButton.heightAnchor.constraint(equalToConstant: 24),
            
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separator.topAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: 20),
            
            navigationContainer.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 20),
            navigationContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: navigationContainer.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: navigationContainer.centerXAnchor),
            
            navigationTileList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            navigationTileList.leadingAnchor.constraint(equalTo: navigationContainer.leadingAnchor, constant: 10),
            navigationTileList.trailingAnchor.constraint(equalTo: navigationContainer.trailingAnchor, constant: -10),
        ])
    }

}
