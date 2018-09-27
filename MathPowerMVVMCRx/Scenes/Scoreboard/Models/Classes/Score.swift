import Foundation
import RealmSwift

class Score: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var score: Int = 0
    @objc dynamic var difficulty: Difficulty = .easy

    @objc dynamic var compoundId = ""

    override static func primaryKey() -> String? {
        return "compoundId"
    }
}
