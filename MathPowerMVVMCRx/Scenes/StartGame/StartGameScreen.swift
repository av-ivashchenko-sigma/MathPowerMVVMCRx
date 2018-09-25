import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class StartGameScreen: Screen {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewHierarchy()
        setupStyle()
        setupContent()
        setupLayout()
        setupObserving()
    }
}

private extension StartGameScreen {
    func setupViewHierarchy() {

    }

    func setupStyle() {
        view.backgroundColor = .yellow
    }

    func setupContent() {
        title = L.StartGame.title
    }

    func setupLayout() {

    }

    func setupObserving() {

    }
}
