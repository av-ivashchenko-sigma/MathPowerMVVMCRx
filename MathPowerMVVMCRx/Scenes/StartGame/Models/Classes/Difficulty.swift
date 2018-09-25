import Foundation

enum Difficulty: CaseIterable {
    case easy
    case medium
    case hard

    static var `default`: Difficulty { return .easy }
}
