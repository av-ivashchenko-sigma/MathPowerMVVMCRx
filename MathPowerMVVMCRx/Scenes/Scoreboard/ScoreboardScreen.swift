import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class ScoreboardScreen: Screen {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension ScoreboardScreen {
    func setupViewHierarchy() {

    }

    func setupStyle() {
        view.backgroundColor = .blue
    }

    func setupContent() {
        title = L.Scoreboard.title
    }

    func setupLayout() {

    }

    func setupObserving() {

    }
}
