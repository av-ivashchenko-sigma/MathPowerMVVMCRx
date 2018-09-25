import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit
import Swinject

class MenuCoordinator: Coordinator<()> {
    private let window: UIWindow
    private let screenFactory: ScreenFactoryProtocol = Container.current.resolve(ScreenFactoryProtocol.self)!
    private let viewModelFactory: ViewModelFactoryProtocol = Container.current.resolve(ViewModelFactoryProtocol.self)!
    private let coordinatorFactory: CoordinatorFactoryProtocol = Container.current.resolve(CoordinatorFactoryProtocol.self)!

    private let navigationController: UINavigationController
    private let screen: MenuScreen

    init(window: UIWindow) {
        self.window = window
        (navigationController, screen) = screenFactory.menuScreen()
    }

    override func start() -> SignalProducer<(), NoError> {
        let menuViewModel = viewModelFactory.menuViewModel()

        menuViewModel.showStartGameAction.completed.observeValues { [weak self] _ in
            self?.showStartGame()
        }
        menuViewModel.showScoreboardAction.completed.observeValues { [weak self] _ in
            self?.showScoreboard()
        }

        window.rootViewController = navigationController
        screen.connectViewModel(menuViewModel)
        window.makeKeyAndVisible()

        return .never
    }
}

// MARK: - Routing

private extension MenuCoordinator {
    func showStartGame() {
        let startGameCoordinator = coordinatorFactory.startGameCoordinator(rootNavigationController: navigationController)
        coordinate(to: startGameCoordinator).start()
    }

    func showScoreboard() {
        let scoreboardCoordinator = coordinatorFactory.scoreboardCoordinator(rootNavigationController: navigationController)
        coordinate(to: scoreboardCoordinator).start()
    }
}
