import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa
import Swinject

protocol ScoreboardViewModelProtocol {
    var cellsViewModels: MutableProperty<[ScoreCellViewModel]?> { get }
    var selectedDifficulty: MutableProperty<Difficulty> { get }
    var backAction: Action<(), (), NoError> { get }
}

class ScoreboardViewModel: ViewModel, ScoreboardViewModelProtocol {
    private let scoreboardDomainService: ScoreboardDomainServiceProtocol = Container.current.resolve(ScoreboardDomainServiceProtocol.self)!

    let cellsViewModels = MutableProperty<[ScoreCellViewModel]?>(nil)
    let selectedDifficulty = MutableProperty<Difficulty>(.easy)

    private(set) lazy var backAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(ScoreboardViewModel.back, object: self))
    }()

    required init() {
        super.init()
        setupObserving()
    }
}

private extension ScoreboardViewModel {
    func setupObserving() {
        selectedDifficulty.producer.combineLatest(with: scoreboardDomainService.scores.producer.skipNil()).startWithValues { (difficulty, scores) in
            print(difficulty)
            print(scores)
        }
    }
}

private extension ScoreboardViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }
}
