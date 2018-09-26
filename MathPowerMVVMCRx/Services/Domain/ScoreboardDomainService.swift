import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol ScoreboardDomainServiceProtocol {
    var scores: Property<[Score]?> { get }

    func syncScores()
    func addScore(_ score: Score)
}

class ScoreboardDomainService {
    private(set) lazy var scores: Property<[Score]?> = Property(capturing: _scores)
    private let _scores = MutableProperty<[Score]?>(nil)
}

extension ScoreboardDomainService: ScoreboardDomainServiceProtocol {
    func syncScores() {

    }

    func addScore(_ score: Score) {
        
    }
}
