import UIKit

protocol ScreenFactoryProtocol {
    func menuScreen() -> (navigationController: UINavigationController, screen: MenuScreen)
}

class ScreenFactory: ScreenFactoryProtocol {
    func menuScreen() -> (navigationController: UINavigationController, screen: MenuScreen) {
        let menuScreen = MenuScreen()
        return (navigationController: UINavigationController(rootViewController: menuScreen), screen: menuScreen)
    }
}
