//
//  HomeViewController.swift
//  tenup-clone
//
//  Created by Margerite Fortuna on 25/03/2025.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blueBackground
        
        setupAppBar()
        setupUI()
    }
    
    private func setupAppBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        
        navigationItem.title = "TEN'UP"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person.fill"),
            style: .plain,
            target: self,
            action: #selector(iconButtonTapped)
        )
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    private func setupUI() {
        let containerStack = UIStackView()
        containerStack.axis = .horizontal
        containerStack.spacing = 16
        containerStack.distribution = .fillEqually
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        
        let fieldContainer = createRoundedContainer(iconName: "star.fill", text: "Terrain")
        let clubContainer = createRoundedContainer(iconName: "house.fill", text: "Club")

        containerStack.addArrangedSubview(fieldContainer)
        containerStack.addArrangedSubview(clubContainer)
        
        let searchTextField = createSearchTextField()

        let searchButton = createSearchButton()

        let mainContainer = UIView()
        mainContainer.backgroundColor = .white
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainContainer)
                
        let mainStack = UIStackView(arrangedSubviews: [containerStack, searchTextField, searchButton])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        mainContainer.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            containerStack.heightAnchor.constraint(equalToConstant: 100),
            
            mainContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func createRoundedContainer(iconName: String, text: String) -> UIView {
        let container = UIView()
        container.backgroundColor = .blueBackground
        container.layer.cornerRadius = 12
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(systemName: iconName))
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        textLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [iconImageView, textLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(stack)

        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 100),

            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])

        return container
    }
    
    private func createSearchTextField() -> UIView {
        let searchContainer = UIView()
        searchContainer.layer.cornerRadius = 12.5
        searchContainer.layer.borderWidth = 1
        searchContainer.layer.borderColor = UIColor.lightGray.cgColor
        // !FIX: Shadows not working...
        searchContainer.layer.shadowColor = UIColor.black.cgColor
        searchContainer.layer.shadowOpacity = 0.2
        searchContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        searchContainer.translatesAutoresizingMaskIntoConstraints = false

        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .gray
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.translatesAutoresizingMaskIntoConstraints = false

        let textField = UITextField()
        textField.placeholder = "Rechercher une ville / code postal"
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView(arrangedSubviews: [searchIcon, textField])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        searchContainer.addSubview(stack)

        NSLayoutConstraint.activate([
            searchContainer.heightAnchor.constraint(equalToConstant: 50),

            stack.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 12),
            stack.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -12),
            stack.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            stack.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor),

            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
        ])

        return searchContainer
    }
    
    private func createSearchButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("RECHERCHER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blueBackground
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }
    
    @objc private func backButtonTapped() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(viewController: UINavigationController(rootViewController: SportSelectionController()))
    }
    
    @objc private func iconButtonTapped() {
        print("Icon Button Tapped!")
    }

}
