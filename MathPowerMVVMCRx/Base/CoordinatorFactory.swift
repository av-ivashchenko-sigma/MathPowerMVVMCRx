import UIKit

protocol CoordinatorFactoryProtocol {
    func menuCoordinator(window: UIWindow) -> MenuCoordinator
    func scoreboardCoordinator(rootNavigationController: UINavigationController) -> ScoreboardCoordinator
    func startGameCoordinator(rootNavigationController: UINavigationController) -> StartGameCoordinator
    func gameCoordinator(rootNavigationController: UINavigationController) -> GameCoordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    private let screenFactory: ScreenFactoryProtocol
    private let viewModelFactory: ViewModelFactoryProtocol

    init(screenFactory: ScreenFactoryProtocol, viewModelFactory: ViewModelFactoryProtocol) {
        self.screenFactory = screenFactory
        self.viewModelFactory = viewModelFactory
    }

    func menuCoordinator(window: UIWindow) -> MenuCoordinator {
        return MenuCoordinator(window: window)
    }

    func scoreboardCoordinator(rootNavigationController: UINavigationController) -> ScoreboardCoordinator {
        return ScoreboardCoordinator(rootNavigationController: rootNavigationController)
    }

    func startGameCoordinator(rootNavigationController: UINavigationController) -> StartGameCoordinator {
        return StartGameCoordinator(rootNavigationController: rootNavigationController)
    }

    func gameCoordinator(rootNavigationController: UINavigationController) -> GameCoordinator {
        return GameCoordinator(rootNavigationController: rootNavigationController)
    }
}
