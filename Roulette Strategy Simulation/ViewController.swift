//
//  ViewController.swift
//  Roulette Strategy Simulation
//
//  Created by Nimish Upadhyay on 3/28/18.
//  Copyright © 2018 Nimish Upadhyay. All rights reserved.
//
//  ABOUT: This simulator is supposed to let you see how well your strategy for Roulette will work out.
//
//  NOTE: You need to visulize the board and know where you are placing the bets. There is no UI for
//  this program, everything is displayed in the console.
//
//  ASSUME: The program assumes that your chips are all the same amount when you place your bet,
//  and that you have a pattern that does not overlap two chips.
//
//  BUGS: The userPicks array does not check for duplicates or have any functionality if you want
//  there are duplicates. Also, userPicks array does not check the upper and lower bounds for bets.

import UIKit

class ViewController: UIViewController {

    var userPicks = [Int]()
    var results = [Int]()
    
    var cashAvailable = 500
    var betAmount = 30
    var numberOfChips = 6
    // Place your type of bet
    var betType = "corners"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a new table
        let table = Table(american: true)
        print("\n\n")
        print("We are starting with \(table.listOfNumbers.count) elements")
        
        // Where we place our bets
        //Insert or remove as you see
        userPicks.append(1)
        userPicks.append(2)
        userPicks.append(4)
        userPicks.append(5)
        userPicks.append(8)
        userPicks.append(9)
        userPicks.append(11)
        userPicks.append(12)
        userPicks.append(13)
        userPicks.append(14)
        userPicks.append(16)
        userPicks.append(17)
        userPicks.append(20)
        userPicks.append(21)
        userPicks.append(23)
        userPicks.append(24)
        userPicks.append(25)
        userPicks.append(26)
        userPicks.append(28)
        userPicks.append(29)
        userPicks.append(32)
        userPicks.append(33)
        userPicks.append(35)
        userPicks.append(36)


        // If you want to have the console print out where all the bets have been placed
        //print("We have placed bets on \(userPicks.description)")
        
        // You can change the of times simulation runs here
        let runs = 100000
        print("Running Simulation \(runs) times")
        
        // For each simulation, it goes through and assigns a random number a winner
        for _ in 1...runs {
            // Choose a random number from 0 to 36
            let randomNumber = Int(arc4random_uniform(UInt32(table.listOfNumbers.count)))
            // Check to see if random number is a number we placed a bet on
            if userPicks.contains(table.listOfNumbers[randomNumber].number!) {
                results.append(1)
                do {
//                    try {
                    // Ensures the the payout typed is choosen correctly and changes the cash based on the payoutRatio
                try cashAvailable = cashAvailable - (betAmount/numberOfChips * (numberOfChips - 1)) + (payoutRatio() * (betAmount/numberOfChips))
//                    }
                }
                catch {
                    print("invalid bet type")
                }
            }
                // Ohterwise, it is not recorded as a win and you lose the entire bet amount
            else {
                results.append(0)
                cashAvailable = cashAvailable - betAmount
            }
        }
        // Generating the post simulations results
        var wins = 0
        var winRatio: Double
        // Count the number of wins
        for num in results {
            if num == 1 {
                wins += 1
            }
//            print(num) // for debug
        }
        
//        print(wins) // for debug
        
        // Calculate a win percentage
        winRatio = Double(wins) / Double(results.count)
        // Print report
        // ADD MORE TO THE REPORT
        print("Number of Wins: \(wins)")
        print("Win Ratio: \(winRatio)\n\n")
        print("Cash after \(runs) trials: \(cashAvailable)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func payoutRatio() throws -> Int {
        do{
            switch betType {
            case "oneNumber":
                return 35
            //        break
            case "twoNumbers":
                return 17
            //        break
            case "threeNumbers":
                return 11
            //        break
            case "fourNumbers":
                return 8
            //        break
            case "sixNumbers":
                return 5
            //        break
            case "corners": // same as fourNumbers
                return 8
            //        break
            // Add more cases as needed
            
            default:
                throw betTypeError.invalidBet
            }
        }
        catch betTypeError.invalidBet {
            print("Not valid type of bet")
        }
        return 0
    }
    
    // A type of error
    enum betTypeError: Error {
        case invalidBet
    }
}

