import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa
import Swinject

protocol ScoreboardViewModelProtocol {
    var cellsViewModels: MutableProperty<[ScoreCellViewModel]?> { get }
    var difficultySelectionViewModel: MutableProperty<DifficultySelectionViewModelProtocol> { get }
    var backAction: Action<(), (), NoError> { get }
}

class ScoreboardViewModel: ViewModel, ScoreboardViewModelProtocol {
    private let scoreboardDomainService: ScoreboardDomainServiceProtocol = Container.current.resolve(ScoreboardDomainServiceProtocol.self)!

    let cellsViewModels = MutableProperty<[ScoreCellViewModel]?>(nil)
    let difficultySelectionViewModel = MutableProperty<DifficultySelectionViewModelProtocol>(DifficultySelectionViewModel())

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
        difficultySelectionViewModel.value.selectedDifficulty
            .producer
            .combineLatest(with: scoreboardDomainService.scores.producer.skipNil()).startWithValues { [weak self] (selectedDifficulty, scores) in
                let filterredScores = scores.filter { $0.difficulty == selectedDifficulty }
                self?.cellsViewModels.value = filterredScores.map { ScoreCellViewModel(name: $0.username, score: $0.score) }
        }
        scoreboardDomainService.syncScores()
    }
}

private extension ScoreboardViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }
}
