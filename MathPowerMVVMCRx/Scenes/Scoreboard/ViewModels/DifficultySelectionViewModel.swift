import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol DifficultySelectionViewModelProtocol {
    var selectedDifficulty: MutableProperty<Difficulty> { get }
    var difficulties: MutableProperty<[Difficulty]> { get }
    var selectDifficulty: Action<Int, (), NoError> { get }
}

class DifficultySelectionViewModel: DifficultySelectionViewModelProtocol {
    let selectedDifficulty = MutableProperty<Difficulty>(.easy)
    let difficulties = MutableProperty<[Difficulty]>(Difficulty.allCases)

    private(set) lazy var selectDifficulty: Action<Int, (), NoError> = {
        return Action(weakExecute: weakify_1_ret(DifficultySelectionViewModel.selectDifficulty, object: self))
    }()
}

private extension DifficultySelectionViewModel {
    func selectDifficulty(_ index: Int) -> SignalProducer<(), NoError> {
        if index <= difficulties.value.count {
            selectedDifficulty.value = difficulties.value[index]
        }
        return .empty
    }
}
