import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

class AppCoordinator: Coordinator<Void> {
    private let window: UIWindow
    private let screenFactory: ScreenFactoryProtocol = ScreenFactory()
    private let viewModelFactory: ViewModelFactoryProtocol = ViewModelFactory()

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> SignalProducer<(), NoError> {
        let menuCoordinator = MenuCoordinator(window: window,
                                              screenFactory: screenFactory,
                                              viewModelFactory: viewModelFactory)
        return coordinate(to: menuCoordinator)
    }
}
