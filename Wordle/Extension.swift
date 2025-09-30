import Foundation

let DONE_EXTENSION_1 = true
let DONE_EXTENSION_2 = true
let DONE_EXTENSION_3 = true

struct Extension {

    /// 🥇 Load a list of words from a file at the given path
    ///
    /// - The file should contain one word per line
    /// - Returns an array of strings, where each element is a word
    /// - If the file cannot be read, returns an empty array
    ///
    /// Set `DONE_EXTENSION_1` to `true` when complete!
    func loadWords(filePath: URL) -> [String] {
        var allWords = [String]()
        if let startWords = try? String(contentsOf: filePath) {
            allWords = startWords.components(separatedBy: "\n")
        }
        return allWords
    }

    /// 🥈 Generate a filename string for a log file
    ///
    /// - Uses the current date and time in the format `yyyymmdd-HHmmss`
    /// - Example: `"20250929-144512.log"`
    ///
    /// Set `DONE_EXTENSION_2` to `true` when complete!
    func logFileName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyymmdd-HHmmss"
        let formattedDate = dateFormatter.string(from: Date()) + ".log"
        return formattedDate
    }

    /// 🥉 Save a log string to a file at the given path
    ///
    /// - Writes the provided `log` string as UTF-8 text
    /// - Returns `true` if saving succeeded, or `false` if an error occurred
    ///
    /// Set `DONE_EXTENSION_3` to `true` when complete!
    func saveLog(log: String, logPath: URL) -> Bool {
        do {
            try log.write(to: logPath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            return false
        }
        return true
    }
}
