import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol StartGameViewModelProtocol {
    var name: MutableProperty<String?> { get }
    var difficulties: MutableProperty<[Difficulty]> { get }
    var selectedDifficulty: MutableProperty<Difficulty> { get }
    var backAction: Action<(), (), NoError> { get }
    var startAction: Action<(), (), NoError> { get }
}

class StartGameViewModel: ViewModel, StartGameViewModelProtocol {
    let name = MutableProperty<String?>(nil)
    let difficulties = MutableProperty<[Difficulty]>(Difficulty.allCases)
    let selectedDifficulty = MutableProperty<Difficulty>(Difficulty.default)
    var isStartEnabled: Property<Bool> { return name.map { $0 != nil && ($0.unwrap { !$0.isEmpty } ?? false) } }

    private(set) lazy var backAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(StartGameViewModel.back, object: self))
    }()
    private(set) lazy var startAction: Action<(), (), NoError> = {
        return Action(enabledIf: isStartEnabled,
                      weakExecute: weakify_0_ret(StartGameViewModel.start, object: self))
    }()
}

private extension StartGameViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }

    func start() -> SignalProducer<(), NoError> {
        return .empty
    }
}
