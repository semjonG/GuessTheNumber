//
//  NumbersModel.swift
//  GuessTheNumber
//
//  Created by mac on 19.04.2022.
//

import Foundation

struct NumbersModel {
    var computersNumber: Int = Int.random(in: 1...100)
    var myNumber: Int = 0
    var myNumberEnterred: Int = 0
}
