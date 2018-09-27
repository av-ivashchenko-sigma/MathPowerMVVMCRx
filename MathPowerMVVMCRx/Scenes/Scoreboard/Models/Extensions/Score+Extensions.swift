import Foundation
import RealmSwift

extension Score {
    var realmValue: [String: Any] {
        return ["name": username, "difficulty": difficulty.rawValue, "score": score]
    }

    convenience init(username: String, difficulty: Difficulty, score: Int) {
        self.init()
        self.username = username
        self.difficulty = difficulty
        self.score = score
    }
}
