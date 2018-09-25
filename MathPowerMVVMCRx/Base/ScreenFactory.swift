import UIKit

protocol ScreenFactoryProtocol {
    func menuScreen() -> (navigationController: UINavigationController, screen: MenuScreen)
    func scoreboardScreen() -> (navigationController: UINavigationController, screen: ScoreboardScreen)
    func startGameScreen() -> (navigationController: UINavigationController, screen: StartGameScreen)
    func gameScreen() -> (navigationController: UINavigationController, screen: GameScreen)
}

class ScreenFactory: ScreenFactoryProtocol {
    func menuScreen() -> (navigationController: UINavigationController, screen: MenuScreen) {
        let menuScreen = MenuScreen()
        return (navigationController: UINavigationController(rootViewController: menuScreen), screen: menuScreen)
    }

    func scoreboardScreen() -> (navigationController: UINavigationController, screen: ScoreboardScreen) {
        let scoreboardScreen = ScoreboardScreen()
        return (navigationController: UINavigationController(rootViewController: scoreboardScreen), screen: scoreboardScreen)
    }

    func startGameScreen() -> (navigationController: UINavigationController, screen: StartGameScreen) {
        let startGameScreen = StartGameScreen()
        return (navigationController: UINavigationController(rootViewController: startGameScreen), screen: startGameScreen)
    }

    func gameScreen() -> (navigationController: UINavigationController, screen: GameScreen) {
        let gameScreen = GameScreen()
        return (navigationController: UINavigationController(rootViewController: gameScreen), screen: gameScreen)
    }
}
