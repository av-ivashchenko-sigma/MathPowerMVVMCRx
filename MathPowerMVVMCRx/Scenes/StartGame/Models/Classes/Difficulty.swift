import Foundation

@objc enum Difficulty: Int, CaseIterable {
    case easy
    case medium
    case hard

    static var `default`: Difficulty { return .easy }
}
