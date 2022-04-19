//
//  CustomButton.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import UIKit

final class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Enter the number", for: .normal)
        
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.numberOfLines = 1
        layer.cornerRadius = 10
        titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

