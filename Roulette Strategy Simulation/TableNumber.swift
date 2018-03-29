//
//  TableNumber.swift
//  Roulette Strategy Simulation
//
//  Created by Nimish Upadhyay on 3/28/18.
//  Copyright © 2018 Nimish Upadhyay. All rights reserved.
//

import Foundation

class TableNumber {
    let number: Int!
    let isEven: Bool!
    let isRed: Bool!
    
    init(num: Int, even: Bool, red: Bool) {
        number = num
        isEven = even
        isRed = red
    }
    
}
