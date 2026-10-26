//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  WHAT THIS GAME DOES NOW
//  You pick rock, paper or scissors. The computer picks one at random.
//  The app shows both moves and counts how many rounds you have played.
//  It can tell when a round is a tie.
//  Game cheats 30% of the time
//  It can tell when the player won or the computer won.
//
//  WHAT IT DOES NOT DO YET
//  Does not have a rat when cheating.
//

import SwiftUI

// The picture for each move. These are emoji, so they are just text.
// TRY: Change these to other emoji to give the game a new theme.
let fishEmoji: String = "🐟"
let parrotEmoji: String = "🦜"
let squirrelEmoji: String = "🐿️"

// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct RockPaperScissorsView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The name of each move, such as "Rock", and the emoji that shows it.
    // Before the first round, nobody has picked a move yet.
    @State var playerMove: String = "No move yet"
    @State var playerEmoji: String = "❓"
    @State var computerMove: String = "No move yet"
    @State var computerEmoji: String = "❓"
    
    // What happened in the last round.
    @State var result: String = "Let's play!"
    
    // How many rounds have been played.
    @State var roundsPlayed: Int = 0
    
    // 30% chance that computer cheats
    @State var cheatTime: Bool = Int.random(in: 1...10) <= 3
    
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 24) {
            
            // The title at the top of the screen.
            Text("Fish Parrot Squirrel")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color.orange)
            // Shrink the title a little if it does not fit on one line.
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            // The two moves, side by side.
            HStack {
                VStack(spacing: 8) {
                    Label("You", systemImage: "person.fill")
                        .font(.headline)
                    Text(playerEmoji)
                        .font(.system(size: 90))
                    Text(playerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
                
                Text("vs")
                    .font(.title)
                    .foregroundStyle(Color.secondary)
                
                VStack(spacing: 8) {
                    Label("Computer", systemImage:
                            "desktopcomputer")
                        .font(.headline)
                    Text(computerEmoji)
                        .font(.system(size: 90))
                    Text(computerMove)
                        .font(.title3)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            .background(Color.orange.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
            // The result of the round.
            Text(result)
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            // One button for each move the player can make.
            // The code inside the braces runs when that button is clicked.
            Text("Choose your move")
                .font(.headline)
                .foregroundStyle(Color.secondary)
            
            HStack(spacing: 12) {
                Button {
                    chooseRock()
                } label: {
                    VStack {
                        Text(fishEmoji)
                            .font(.system(size: 44))
                        Text("Fish")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    choosePaper()
                } label: {
                    VStack {
                        Text(parrotEmoji)
                            .font(.system(size: 44))
                        Text("Parrot")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    chooseScissors()
                } label: {
                    VStack {
                        Text(squirrelEmoji)
                            .font(.system(size: 44))
                        Text("Squirrel")
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.bordered)
            .font(.headline)
            // TRY: Change teal to another colour. Change it in the title and the moves box too.
            .tint(Color.orange)
            
            Text("Rounds played: \(roundsPlayed)")
                .font(.headline)
                .foregroundStyle(Color.secondary)
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 520, minHeight: 640)
    }
    
    // MARK: - Functions
    
    // The player picked rock.
    func chooseRock() {
        playerMove = "Fish"
        playerEmoji = fishEmoji
        playRound()
    }
    
    // The player picked paper.
    func choosePaper() {
        playerMove = "Parrot"
        playerEmoji = parrotEmoji
        playRound()
    }
    
    // The player picked scissors.
    func chooseScissors() {
        playerMove = "Squirrel"
        playerEmoji = squirrelEmoji
        playRound()
    }
    
    // The computer picks its move at random.
    func chooseComputerMove() {
        
        if cheatTime == true {
            moveThatBeats()
        }
        else {
            // Pick 1, 2 or 3. Each number stands for one move.
            let randomNumber: Int = Int.random(in: 1...3)
            
            if randomNumber == 1 {
                computerMove = "Fish"
                computerEmoji = fishEmoji
            } else if randomNumber == 2 {
                computerMove = "Parrot"
                computerEmoji = parrotEmoji
            } else {
                computerMove = "Squirrel"
                computerEmoji = squirrelEmoji
            }
        }
    }
    
    // The computer cheats and picks the winning option.
    func moveThatBeats() {
        
        if playerMove == "Fish" {
            computerMove = "Parrot"
        }
        else if playerMove == "Parrot" {
            computerMove = "Squirrel"
        }
        else {
            computerMove = "Fish"
        }
        
    }
    
    // Plays one round, once the player has picked a move.
    func playRound() {
        chooseComputerMove()
        roundsPlayed += 1
        
        if playerMove == computerMove {
            // TRY: Change what the game says when there is a tie.
            result = "It's a tie!"
        } else {
            if playerMove == "Fish" &&
                computerMove == "Squirrel" ||
                playerMove == "Parrot" &&
                computerMove == "Fish" ||
                playerMove == "Squirrel" &&
                computerMove == "Parrot" {
                result = "Player Won"
                
            } else {
                result = "Computer won"
            }
        }
    }
}
    #Preview {
        RockPaperScissorsView()
    }
