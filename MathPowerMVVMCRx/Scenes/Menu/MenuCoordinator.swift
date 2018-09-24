import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

class MenuCoordinator: Coordinator<()> {
    private let window: UIWindow
    private let screenFactory: ScreenFactoryProtocol
    private let viewModelFactory: ViewModelFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(window: UIWindow, screenFactory: ScreenFactoryProtocol, viewModelFactory: ViewModelFactoryProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.window = window
        self.screenFactory = screenFactory
        self.viewModelFactory = viewModelFactory
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() -> SignalProducer<(), NoError> {
        let (navVC, scene) = screenFactory.menuScreen()
        let viewModel = viewModelFactory.menuViewModel()

        viewModel.showStartGameAction.values.observeValues { [weak self] in self?.showStartGame() }
        viewModel.showScoreboardAction.values.observeValues { [weak self] in self?.showScoreboard() }

        window.rootViewController = navVC
        scene.connectViewModel(viewModel)
        window.makeKeyAndVisible()

        return .empty
    }
}

// MARK: - Routing

private extension MenuCoordinator {
    func showStartGame() {
        let startGameCoordinator
    }

    func showScoreboard() {

    }
}
