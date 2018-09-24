import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol MenuViewModelProtocol {
    var showStartGameAction: Action<(), (), NoError> { get }
    var showScoreboardAction: Action<(), (), NoError> { get }
}

class MenuViewModel: ViewModel, MenuViewModelProtocol {
    private(set) lazy var showStartGameAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(MenuViewModel.showStartGame, object: self))
    }()

    private(set) lazy var showScoreboardAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(MenuViewModel.showScoreboard, object: self))
    }()
}

private extension MenuViewModel {
    func showStartGame() -> SignalProducer<(), NoError> {
        return .empty
    }

    func showScoreboard() -> SignalProducer<(), NoError> {
        return .empty
    }
}
