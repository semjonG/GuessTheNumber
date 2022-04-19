//
//  ResultsViewController.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import UIKit

 final class HumanResultVC: UIViewController {
    
    var numbersModel = NumbersModel()
    
    private let gamersResultTextField = NumberTextField()
    private let enterNumberButton = CustomButton()
    private let roundLabel = MainLabel()
    private let whoseGuessesLabel = MainLabel()
    private let resultLabel = MainLabel()
    
    var counter = 0
    var compCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        setupViews()
        setConstraints()
        
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        enterNumberButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        gamersResultTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        view.addSubview(gamersResultTextField)
        view.addSubview(enterNumberButton)
        view.addSubview(roundLabel)
        roundLabel.text = "Try № \(counter)"
        whoseGuessesLabel.text = "You are guessing"
        view.addSubview(whoseGuessesLabel)
        view.addSubview(resultLabel)
        enterNumberButton.isEnabled = false
        enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
    }
    
    @objc func didChangeText() {
        if let number = gamersResultTextField.text?.count {
            
            if number > 0 {
                enterNumberButton.backgroundColor = .systemBlue
                enterNumberButton.isEnabled = true
            } else {
                enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
                enterNumberButton.isEnabled = false
            }
        }
    }
    
    func checkResult(myNumber: Int) {
        if myNumber == numbersModel.computersNumber {
            resultLabel.isHidden = true
            counter += 1
            
            let resultsVC = AllResultsVC()
            resultsVC.myCounter = counter
            resultsVC.compCounter = compCounter
            
            show(resultsVC, sender: nil)
            
        } else if myNumber > numbersModel.computersNumber {
            resultLabel.text = "No, my number is less than yours"
        } else if myNumber < numbersModel.computersNumber {
            resultLabel.text = "No, my number is more than yours"
        }
    }
    
    @objc func enterButtonTapped() {
        if let text = gamersResultTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            numbersModel.myNumberEnterred = number
            print(number)
            checkResult(myNumber: numbersModel.myNumberEnterred)
            counter += 1
            roundLabel.text = "Try № \(counter)"
        }
    }
}

extension HumanResultVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            whoseGuessesLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 10),
            whoseGuessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gamersResultTextField.topAnchor.constraint(equalTo: whoseGuessesLabel.bottomAnchor, constant: 60),
            gamersResultTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gamersResultTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            enterNumberButton.topAnchor.constraint(equalTo: gamersResultTextField.bottomAnchor, constant: 30),
            enterNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            resultLabel.topAnchor.constraint(equalTo: enterNumberButton.bottomAnchor, constant: 30),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension HumanResultVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(HumanResultVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
