//
//  Solution.swift
//  WordleTeacher
//
//  Created by Bersey, Henry - HTB on 28/09/2025.
//


struct Solution {

    /// 1️⃣ Return an array of Bools where each value is `true`
    /// if the letter in the guess is correct and in the correct position
    ///
    /// - Example:
    ///   - guess:  ["A", "B", "C", "D", "E"]
    ///   - answer: ["A", "X", "C", "Y", "E"]
    ///   - return: [true, false, true, false, true]
    func exactMatches(guess: [Character], answer: [Character]) -> [Bool] {
        // TODO: Compare each letter in guess to the same index in answer
        var vals = [false, false, false, false ,false]
        for i in 0...guess.count - 1 {
            if guess[i] == answer[i] {
                vals[i] = true
            }
        }
        return vals
    }

    /// 2️⃣ Return an array of Bools where each value is `true`
    /// if the letter in the guess exists somewhere in the answer
    /// but NOT in the correct position
    ///
    /// - Only mark true if the letter is in the word AND not an exact match
    /// - Example:
    ///   - guess:  ["F", "B", "C", "D", "E"]
    ///   - answer: ["A", "C", "B", "D", "E"]
    ///   - return: [false, true, true, false, false]
    func partialMatches(guess: [Character], answer: [Character]) -> [Bool] {
        // TODO: Use indexing and contains to check for wrong-position matches
        var vals = [false, false, false, false ,false]
        for i in 0...guess.count - 1 {
            if answer.contains(guess[i]) {
                vals[i] = true
            }
        }
        return vals
    }

    /// 3️⃣ Return an array of emoji strings (["✅", "⚠️", "🛑"]) that show
    /// feedback for each letter in the guess:
    /// - ✅ if the letter is correct and in the correct place
    /// - ⚠️ if the letter is in the word but wrong place
    /// - 🛑 if the letter is not in the word at all
    func generateFeedback(guess: [Character], answer: [Character]) -> [String] {
        // TODO: Use exactMatches and partialMatches to build feedback array
        var vals = ["", "", "", "", ""]
        let exacts = exactMatches(guess: guess, answer: answer)
        let partials = partialMatches(guess: guess, answer: answer)
        for i in 0...guess.count - 1 {
            if exacts[i] {
                vals[i] = "✅"
            } else if partials[i] {
                vals[i] = "⚠️"
            } else {
                vals[i] = "🛑"
            }
        }
        return vals
    }

    /// 4️⃣ Convert an array of emoji strings into a single display string
    ///
    /// - Example:
    ///   - input: ["✅", "⚠️", "🛑"]
    ///   - return: "✅ ⚠️ 🛑"
    func arrayToDisplayString(_ arr: [String]) -> String {
        // TODO: Use .joined(separator:) to turn the array into a display line
        return arr.joined(separator: "")
    }

    /// 5️⃣ Return true if ALL characters in the guess match the answer exactly
    /// (i.e., the player has guessed the full word)
    ///
    /// - Tip: Use exactMatches and check if all values are `true`
    func isWinningGuess(guess: [Character], answer: [Character]) -> Bool {
        // TODO: Check if the player has guessed all characters correctly
        let exacts = exactMatches(guess: guess, answer: answer)
        for x in exacts {
            if x != true {
                return false
            }
        }
        return true
    }
}
