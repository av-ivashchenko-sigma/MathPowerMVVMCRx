import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol ScoreboardViewModelProtocol {
    var backAction: Action<(), (), NoError> { get }
}

class ScoreboardViewModel: ViewModel, ScoreboardViewModelProtocol {
    private(set) lazy var backAction: Action<(), (), NoError> = {
        return Action(weakExecute: weakify_0_ret(ScoreboardViewModel.back, object: self))
    }()
}

private extension ScoreboardViewModel {
    func back() -> SignalProducer<(), NoError> {
        return .empty
    }
}
