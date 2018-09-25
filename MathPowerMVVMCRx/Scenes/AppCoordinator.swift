import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit
import Swinject

class AppCoordinator: Coordinator<Void> {
    private let window: UIWindow
    private let coordinatorFactory: CoordinatorFactoryProtocol = Container.current.resolve(CoordinatorFactoryProtocol.self)!

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> SignalProducer<(), NoError> {
        let menuCoordinator = coordinatorFactory.menuCoordinator(window: window)
        return coordinate(to: menuCoordinator)
    }
}
