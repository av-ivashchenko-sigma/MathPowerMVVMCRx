import UIKit

protocol CoordinatorFactoryProtocol {
    func menuCoordinator() -> StartGameCoordinator
    func scoreboardCoordinator() -> ScoreboardCoordinator
    func startGameCoordinator() -> StartGameCoordinator
}

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func menuCoordinator() -> StartGameCoordinator {
        return MenuCoordinator()
    }

    func scoreboardCoordinator() -> ScoreboardCoordinator {
        return ScoreboardCoordinator()
    }

    func startGameCoordinator() -> StartGameCoordinator {
        return ScoreboardCoordinator()
    }
}
