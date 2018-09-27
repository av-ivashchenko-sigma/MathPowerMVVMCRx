import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa
import Swinject

protocol ScoreboardDomainServiceProtocol {
    var scores: Property<[Score]?> { get }

    func syncScores()
    func addScore(_ score: Score)
}

class ScoreboardDomainService {
    private(set) lazy var scores: Property<[Score]?> = Property(capturing: _scores)
    private let _scores = MutableProperty<[Score]?>(nil)

    private let realmService: RealmServiceProtocol = Container.current.resolve(RealmServiceProtocol.self)!

    required init() {
        setupObserving()
    }
}

extension ScoreboardDomainService: ScoreboardDomainServiceProtocol {
    func syncScores() {
        realmService.syncScores()
    }

    func addScore(_ score: Score) {
        realmService.saveScore(score)
    }
}

private extension ScoreboardDomainService {
    func setupObserving() {
        realmService.scores.producer.startWithValues { [weak self] in
            self?._scores.value = $0
        }
    }
}
