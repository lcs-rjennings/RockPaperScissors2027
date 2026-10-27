# Fish Parrot Squirrel (Rock Paper Scissors) - How to play

You against the computer. Click fish, parrot or squirrel. The computer picks its move at random (mostly!), and the app shows both moves side by side. It also counts how many rounds you have played. Fish beats squirrel, parrot beats fish, and squirrel beats parrot.

## How to run the game

1. Open the game's folder and double-click **RockPaperScissors.xcodeproj**. Xcode opens.
2. At the top of the Xcode window, find the menu that names a device. Make sure it says **My Mac**.
3. Press **Command-R**, or click the triangle-shaped **Run** button.

The first run takes a minute while Xcode builds the app. After that, the game opens in its own window on your Mac and you can play.

To read the code, click **RockPaperScissorsView.swift** in the list of files on the left. Most of the game lives in that one file.

CHEATING PART DOES NOT WORK

## How it works

A new feature has been added where the computer cheats 30% of the time. It is done through the variable cheatTime which is a Bool variable. The code randomly generates a number between 1 and 10 every round, and if that number is smaller than 4, then cheatTime becomes true. In the function chooseComputerMove, when cheatTime is true, the function moveThatBeats runs, and it uses if/else if/else to change the computerMove to the winning move depending what the playerMove is (i.e. computerMove = "Parrot" (Paper) if playerMove = "Fish" (Rock)).

In function playRound, it is detected who won: If the computer won, the player won, or it was a tie. It detects a tie by checking if the computerMove = the playerMove. It detects if the player won by using an else if statement containing && and || statements to see if the player chose the winning option. I chose to use && and || statements because it uses less lines of code than multiple "if" statements, and it is clearer to read. Finally, to check if the computer won, there is an else statement because the computer winning is the only other possible solution. 

## What the game does now/what I added

1. The game tells you whether it was a tie, the player won, or the computer won.
2. The game cheats 30% of the time and wins.
3. Instead of Rock, Paper and Scissors, it is now Fish, Parrot, Squirrel.
4. Changed colour scheme from teal to orange because orange is my favourite colour!

What it does not do yet:
1. Personalized message when the computer cheats (if the computer is actually cheating). See test table below.

## Testing

| Test | Chosen Input | What should happen | What did happen |
| :--- | :---: | :---: | --: |
| Make the computer cheat 100% of the time. |  Computer would cheat if the random number from 1 to 10 was smaller than 11. | The computer should always beat the player. | The computer always beat the player. |
| Make sure that Fish beats Squirrel, Squirrel beats Parrot, and Parrot beats Fish. | Chose each option until the computer chose the winning option, losing option, and option that tied. | The display message should appear accordingly to the situation. | The correct message appeared each round. |
| Make the computer have a personalized message when cheating |  Instead of simply "Computer Won", "Computer Cheated" appears when cheatTime = true | The "Computer Cheated" line should appear one third of the time with the normal code, but I also tried it with the computer cheating 100% of the time. | The message did not appear for the 30% chance, but it did appear when the computer cheated every round. |

## Credits

When you make the game your own, add to this list. Name any AI tool you used and what you used it for. Name any code, images or sounds that came from somewhere else, and say where they came from.

- Starter game: Mr. Gordon, ICS3U
- Charlotte helped me decide when the computer wins or the player wins, with the && and || lines.
