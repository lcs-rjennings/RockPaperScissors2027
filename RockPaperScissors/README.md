# Rock Paper Scissors

You against the computer. Click rock, paper or scissors. The computer picks its move at random, and the app shows both moves side by side. It also counts how many rounds you have played.

NEW: The game tells you whether it was a tie, the player won, or the computer won.
NEW: The game cheats 30% of the time and wins.
NEW: Instead of Rock, Paper and Scissors, it is now Fish, Parrot, Squirrel.
NEW: Changed colour scheme from teal to orange 

## How to run the game

1. Open the game's folder and double-click **RockPaperScissors.xcodeproj**. Xcode opens.
2. At the top of the Xcode window, find the menu that names a device. Make sure it says **My Mac**.
3. Press **Command-R**, or click the triangle-shaped **Run** button.

The first run takes a minute while Xcode builds the app. After that, the game opens in its own window on your Mac and you can play.

To read the code, click **RockPaperScissorsView.swift** in the list of files on the left. Most of the game lives in that one file.

## How it works

A new feature has been added where the computer cheats 30% of the time. It is done through the variable cheatTime which is a Bool variable. The code randomly generates a number between 1 and 10 every round, and if that number is < 4, then cheatTime becomes true. In the function chooseComputerMove, when cheatTime is true, the function moveThatBeats runs, and it uses if/else if/else to change the computerMove to the winning move depending what the playerMove is (i.e. computerMove = "Parrot" (Paper) if playerMove = "Fish" (Rock)).

In function playRound, it is detected who won: If the computer won, the player won, or it was a tie. 

## Credits

I wrote this starter game for my ICS3U course at Lakefield College School.

When you make the game your own, add to this list. Name any AI tool you used and what you used it for. Name any code, images or sounds that came from somewhere else, and say where they came from.

- Starter game: Mr. Gordon, ICS3U
- Charlotte helped me decide when the computer wins or the player wins, with the && and || lines.
