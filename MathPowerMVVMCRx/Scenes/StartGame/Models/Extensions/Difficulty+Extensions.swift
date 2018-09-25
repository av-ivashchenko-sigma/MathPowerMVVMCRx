import Foundation

extension Difficulty {
    var title: String {
        switch self {
        case .easy: return L.Difficulty.easy
        case .medium: return L.Difficulty.medium
        case .hard: return L.Difficulty.hard
        }
    }
}
