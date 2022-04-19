//
//  StartNewGameButton.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import UIKit

class StartNewGameButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Start New Game", for: .normal)
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.numberOfLines = 1
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
    }
}
