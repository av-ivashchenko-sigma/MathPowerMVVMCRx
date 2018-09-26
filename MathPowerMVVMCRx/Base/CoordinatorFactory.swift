import UIKit
import Swinject

protocol CoordinatorFactoryProtocol {
    func menuCoordinator(window: UIWindow) -> MenuCoordinator
    func scoreboardCoordinator(rootNavigationController: UINavigationController) -> ScoreboardCoordinator
    func startGameCoordinator(rootNavigationController: UINavigationController) -> StartGameCoordinator
    func gameCoordinator(rootNavigationController: UINavigationController) -> GameCoordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    private let screenFactory: ScreenFactoryProtocol = Container.current.resolve(ScreenFactoryProtocol.self)!
    private let viewModelFactory: ViewModelFactoryProtocol = Container.current.resolve(ViewModelFactoryProtocol.self)!

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
