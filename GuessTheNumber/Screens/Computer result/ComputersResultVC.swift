//
//  ComputersResultViewController.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import UIKit

final class ComputersResultVC: UIViewController {
    
    //MARK: - Private properties
    private let tryLabel = MainLabel()
    private let playerGuessesLabel = MainLabel()
    private let guessesLabel = MainLabel()
    private let lessButton = CustomButton()
    private let equalButton = CustomButton()
    private let moreButton = CustomButton()
    
    private lazy var buttonsStackView = UIStackView(arrangedSubviews: [lessButton, equalButton, moreButton], axis: .horizontal, spacing: 10)
    
    var numberModel = NumbersModel()
    
    var min = 0
    var max = 100
    var mid = 0
    var counter = 1
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
        lessButton.setTitle(">", for: .normal)
        lessButton.backgroundColor = .white
        lessButton.layer.borderWidth = 1
        lessButton.layer.borderColor = UIColor.black.cgColor
        lessButton.setTitleColor(UIColor.black, for: .normal)
        
        equalButton.setTitle("=", for: .normal)
        equalButton.backgroundColor = .white
        equalButton.layer.borderWidth = 1
        equalButton.layer.borderColor = UIColor.black.cgColor
        equalButton.setTitleColor(UIColor.black, for: .normal)
        
        moreButton.setTitle("<", for: .normal)
        moreButton.backgroundColor = .white
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.black.cgColor
        moreButton.setTitleColor(UIColor.black, for: .normal)
        
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        
        counter = 1
        tryLabel.text = "Try № \(counter)"
        playerGuessesLabel.text = "Computer is guessing"
        mid = (min + max) / 2
        guessesLabel.text = "Your number is - \(mid)?"
        buttonsStackView.distribution = .fillEqually
        
        view.addSubview(tryLabel)
        view.addSubview(playerGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(buttonsStackView)
    }
    
    //MARK: - Actions
    @objc func lessButtonTapped() {
        moreFindNumber()
    }
    
    @objc func equalButtonTapped() {
        if numberModel.myNumber == mid {
            equalButton.isEnabled = true
            let humanResultVC = HumanResultVC()
            humanResultVC.compCounter = counter
            present(humanResultVC, animated: true, completion: nil)
        }
    }
    
    @objc func moreButtonTapped() {
        lessFindNumber()
    }
    
    func lessFindNumber() {
        if numberModel.myNumber < mid {
            max = mid
            mid = (min + max) / 2
            counter += 1
            tryLabel.text = "Try № \(counter)"
        }
    }
    
    func moreFindNumber() {
        if numberModel.myNumber > mid {
            min = mid
            mid = (min + max) / 2
            counter += 1
            tryLabel.text = "Try № \(counter)"
        }
    }
}

//MARK: - Extensions
extension ComputersResultVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerGuessesLabel.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 20),
            playerGuessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            guessesLabel.topAnchor.constraint(equalTo: playerGuessesLabel.bottomAnchor, constant: 100),
            guessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}

