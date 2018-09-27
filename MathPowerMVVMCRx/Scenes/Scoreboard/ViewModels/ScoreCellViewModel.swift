import Foundation
import Result
import ReactiveSwift
import ReactiveCocoa

protocol ScoreCellViewModelProtocol {
    var name: MutableProperty<String?> { get }
    var score: MutableProperty<Int> { get }
}

class ScoreCellViewModel: ScoreCellViewModelProtocol {
    let name = MutableProperty<String?>(nil)
    let score = MutableProperty<Int>(0)

    init(name: String, score: Int) {
        self.name.value = name
        self.score.value = score
    }
}
