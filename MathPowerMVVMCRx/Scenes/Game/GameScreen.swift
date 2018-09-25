import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class GameScreen: Screen {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension GameScreen {
    func setupViewHierarchy() {

    }

    func setupStyle() {
        view.backgroundColor = .purple
    }

    func setupContent() {
        title = L.Game.title
    }

    func setupLayout() {

    }

    func setupObserving() {

    }
}
