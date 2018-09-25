import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol GameViewModelProtocol {
    var backAction: Action<(), (), NoError> { get }
}

class GameViewModel: ViewModel, GameViewModelProtocol {
    private(set) lazy var backAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(GameViewModel.back, object: self))
    }()
}

private extension GameViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }
}
