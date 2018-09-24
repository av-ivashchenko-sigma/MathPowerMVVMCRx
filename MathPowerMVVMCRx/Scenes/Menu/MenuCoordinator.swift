import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

class MenuCoordinator: Coordinator<()> {
    private let window: UIWindow
    private let screenFactory: ScreenFactoryProtocol
    private let viewModelFactory: ViewModelFactoryProtocol

    init(window: UIWindow, screenFactory: ScreenFactoryProtocol, viewModelFactory: ViewModelFactoryProtocol) {
        self.window = window
        self.screenFactory = screenFactory
        self.viewModelFactory = viewModelFactory
    }

    override func start() -> SignalProducer<(), NoError> {
        let (navVC, scene) = screenFactory.menuScreen()
        let viewModel = viewModelFactory.menuViewModel()
        window.rootViewController = navVC
        scene.connectViewModel(viewModel)
        window.makeKeyAndVisible()

        return .empty
    }
}
