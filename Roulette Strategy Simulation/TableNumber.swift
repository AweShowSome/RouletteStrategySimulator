//
//  TableNumber.swift
//  Roulette Strategy Simulation
//
//  Created by Nimish Upadhyay on 3/28/18.
//  Copyright © 2018 Nimish Upadhyay. All rights reserved.
//

import Foundation

class TableNumber {
    // Board element properties
    let number: Int!
    let isEven: Bool!
    let isRed: Bool!
//     ADD MORE ELEMENTS AS YOU SEE FIT
    
    /*
     Creates a board element with certain properties
     */
    init(num: Int, even: Bool, red: Bool) {
        number = num
        isEven = even
        isRed = red
    }
}
