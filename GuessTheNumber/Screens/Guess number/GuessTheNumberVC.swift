//
//  GuessTheNumberViewController.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import UIKit

final class GuessTheNumberVC: UIViewController {
    
    //MARK: - Private properties
    private let tryLabel = MainLabel()
    private let numberTextField = NumberTextField()
    private let enterNumberButton = CustomButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .white
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        tryLabel.text = "Try № "
        enterNumberButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        numberTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        view.addSubview(tryLabel)
        view.addSubview(numberTextField)
        view.addSubview(enterNumberButton)
        enterNumberButton.isEnabled = false
        enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
        enterNumberButton.layer.cornerRadius = 16
    }
    
    //MARK: - Actions
    @objc func didChangeText() {
        if let number = numberTextField.text?.count {
            if number > 0 {
                enterNumberButton.backgroundColor = .systemBlue
                enterNumberButton.isEnabled = true
            } else {
                enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
                enterNumberButton.isEnabled = false
            }
        }
    }
    
    @objc func enterButtonTapped() {
        if let text = numberTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            let computersResultVC = ComputersResultVC()
            computersResultVC.numberModel.myNumber = number
            self.present(computersResultVC, animated: true, completion: nil)
            
        }
    }
}
//MARK: - Extensions
extension GuessTheNumberVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([

            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            numberTextField.topAnchor.constraint(equalTo: tryLabel.bottomAnchor, constant: 50),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            enterNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            enterNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            enterNumberButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

extension GuessTheNumberVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(GuessTheNumberVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
