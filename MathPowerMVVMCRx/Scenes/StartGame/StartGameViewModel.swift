import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol StartGameViewModelProtocol {
    var backAction: Action<(), (), NoError> { get }
}

class StartGameViewModel: ViewModel, StartGameViewModelProtocol {
    private(set) lazy var backAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(StartGameViewModel.back, object: self))
    }()
}

private extension StartGameViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }
}
