import Foundation

let ANSWER = Array("STAIR")
let solution = Solution()

func getGuess() -> [Character] {
    var guess: String
    repeat {
        print("Please enter a 5-character word: ", terminator: "")
        guess = readLine() ?? ""
    } while guess.count != 5

    return Array(guess.uppercased())
}

var remainingTries = 6
var won = false

while remainingTries > 0 {
    let guess = getGuess()
    
    let feedbackArray = solution.generateFeedback(guess: guess, answer: ANSWER)
    let feedbackString = solution.arrayToDisplayString(feedbackArray)
    print(feedbackString)
    
    if solution.isWinningGuess(guess: guess, answer: ANSWER) {
        print("🎉 YOU WIN!")
        won = true
        break
    }
    
    remainingTries -= 1
}

if !won {
    print("😞 You lost. The answer was: \(String(ANSWER))")
}
