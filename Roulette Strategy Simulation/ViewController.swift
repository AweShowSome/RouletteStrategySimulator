//
//  ViewController.swift
//  Roulette Strategy Simulation
//
//  Created by Nimish Upadhyay on 3/28/18.
//  Copyright © 2018 Nimish Upadhyay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userPicks = [Int]()
    var results = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a new table
        let table = Table(american: true)
        print("\n\n")
        print("We are starting with \(table.listOfNumbers.count) elements")
        // Where we place our bets
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


        print("We have placed bets on \(userPicks.description)")
        
        // Number of times simulation runs
        let runs = 100000
        print("Running Simulation \(runs) times")
        for _ in 1...runs {
            // Choose a random number
            let randomNumber = Int(arc4random_uniform(UInt32(table.listOfNumbers.count)) + 1)
            // Check to see if random number is a number we placed a bet on
            if userPicks.contains(table.listOfNumbers[randomNumber - 1].number!) {
                results.append(1)
            } else {
                results.append(0)
            }
        }
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
        print("Number of Wins: \(winRatio)\n\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

