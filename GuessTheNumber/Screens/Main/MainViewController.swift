//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by mac on 18.04.2022.
//

import UIKit

 final class MainViewController: UIViewController {
    
    //MARK: - Private properties
    private let nameLabel = MainLabel()
    private let startNewGameButton = StartNewGameButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        nameLabel.text = "My Awesome Game"
        startNewGameButton.addTarget(self, action: #selector(showGuessTheNumberVC), for: .touchUpInside)
        view.addSubview(nameLabel)
        view.addSubview(startNewGameButton)
    }
    
    //MARK: - Actions
    @objc
    func showGuessTheNumberVC() {
        let guessVC = GuessTheNumberVC()
        self.present(guessVC, animated: true, completion: nil)
    }
}

extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startNewGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            startNewGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startNewGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startNewGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startNewGameButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}


