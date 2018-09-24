import UIKit

protocol ViewModelFactoryProtocol {
    func menuViewModel() -> MenuViewModel
}

class ViewModelFactory: ViewModelFactoryProtocol {
    func menuViewModel() -> MenuViewModel {
        return MenuViewModel()
    }
}
