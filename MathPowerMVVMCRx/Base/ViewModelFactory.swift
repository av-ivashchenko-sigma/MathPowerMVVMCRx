import UIKit

protocol ViewModelFactoryProtocol {
    func menuViewModel() -> MenuViewModel
    func scoreboardViewModel() -> ScoreboardViewModel
    func startGameViewModel() -> StartGameViewModel
    func gameViewModel() -> GameViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    func menuViewModel() -> MenuViewModel {
        return MenuViewModel()
    }

    func scoreboardViewModel() -> ScoreboardViewModel {
        return ScoreboardViewModel()
    }

    func startGameViewModel() -> StartGameViewModel {
        return StartGameViewModel()
    }

    func gameViewModel() -> GameViewModel {
        return GameViewModel()
    }
}
