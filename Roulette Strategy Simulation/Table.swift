//
//  Table.swift
//  Roulette Strategy Simulation
//
//  Created by Nimish Upadhyay on 3/28/18.
//  Copyright © 2018 Nimish Upadhyay. All rights reserved.
//

import Foundation

class Table {
    var listOfNumbers = [TableNumber]()
    
    init(american: Bool) {
        // Small test of 9 elements
//        listOfNumbers.append(TableNumber(num: 1, even: false, red: true))
//        listOfNumbers.append(TableNumber(num: 2, even: true, red: false))
//        listOfNumbers.append(TableNumber(num: 3, even: false, red: true))
//        listOfNumbers.append(TableNumber(num: 4, even: true, red: false))
//        listOfNumbers.append(TableNumber(num: 5, even: false, red: true))
//        listOfNumbers.append(TableNumber(num: 6, even: true, red: false))
//        listOfNumbers.append(TableNumber(num: 7, even: false, red: true))
//        listOfNumbers.append(TableNumber(num: 8, even: true, red: false))
//        listOfNumbers.append(TableNumber(num: 9, even: false, red: true))
        
        // Create a new list of numbers
//        var listOfNumbers = [TableNumber]() // This line causes problems! But I should not even be using this line.
        
        // A counter that counts through 9 numbers and should execute a flip of the coloring format
        var importantColorCounter = 0
        // Decides on the coloring format for the next 9 numbers
        var firstColoringFormat = true
        // Counter helper to color the numbers while in the second color format
        var secondColoringFormatCounter = 0
        var even = false
        var red = false

        // create a table based of the version of the board
        if american == true {
            for i in 1...36 {
//                print(i)
                importantColorCounter += 1
                // assigns variable even or odd
                even = evenFinder(num: i)
                red = redColorer(even: even, colorFormat: firstColoringFormat, secondColorCounter: secondColoringFormatCounter)
                if !firstColoringFormat {
                    secondColoringFormatCounter += 1
                }

                listOfNumbers.append(TableNumber(num: i, even: even, red: red))
//                print(listOfNumbers[i-1].number)
                // swap the coloring pattern after 9 numbers, and reset the secondColorFormatCounter
                if importantColorCounter % 9 == 0 {
                    firstColoringFormat = !firstColoringFormat
                    secondColoringFormatCounter = 0
                }
            }

            print(listOfNumbers.count)
        } else {
            // Currently for testing purposes
            listOfNumbers.append(TableNumber(num: -1, even: false, red: false))
        }
    }
    
    /**
     Determines whether a number is even or not
     */
    private func evenFinder(num: Int) -> Bool {
        return num % 2 == 0
    }
    
    /**
     Returns whether a number is red or not
     */
    private func redColorer(even: Bool, colorFormat: Bool, secondColorCounter: Int) -> Bool {
        // if the first color format, make the red property true for the odd
        if colorFormat == true {
            return !even
        } else { // otherwise make the 3rd 5th 7th 9th in the sequence red
            let tempCounter = secondColorCounter + 1
            return tempCounter % 3 == 0 || tempCounter % 5 == 0 || tempCounter % 7 == 0
        }
    }
}
