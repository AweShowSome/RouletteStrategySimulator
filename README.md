# RouletteStrategySimulator
A program where you can test your strategies for Roulette over many simulations
---------------------------------------------------------------------------------

I know I could have just made a Playground file rather than creating an Xcode project for this program. Ignore that fact.
Know that this program can still add more functionality.

You should know how you want the bet to work in your mind, then go ahead and put it in the program.

There are a few assumptions that the program makes:
* No chips overlap
* All chips have the same value

Here are some properties that you can change for your simulation within ViewController.swift:
* cashAvailable - The starting amount of cash.
* betAmount - How much your total bet for each round is.
* numberOfChips - How many chips you placed down on the board.
* betType - Ex: oneNumber, twoNumbers, threeNumbers, fourNumbers (corners), ect. This affects your payout ratio.
* runs - How many times you want the simulation to run.

The results will be printed out to the console.

In the Table class, it goes ahead and creates an American roulette board or a European board (still needs to be implemented).

In the TableNumber class, it lays the structure for a board number with certain properties.
