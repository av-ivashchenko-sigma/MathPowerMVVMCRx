import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit
import Swinject

enum GameCoordinatorResult {
    case cancel
}

class GameCoordinator: Coordinator<GameCoordinatorResult> {
    private let rootNavigationController: UINavigationController
    private let screenFactory: ScreenFactoryProtocol = Container.current.resolve(ScreenFactoryProtocol.self)!
    private let viewModelFactory: ViewModelFactoryProtocol = Container.current.resolve(ViewModelFactoryProtocol.self)!
    private let coordinatorFactory: CoordinatorFactoryProtocol = Container.current.resolve(CoordinatorFactoryProtocol.self)!

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    override func start() -> SignalProducer<GameCoordinatorResult, NoError> {
        let (_, scene) = screenFactory.gameScreen()
        let viewModel = viewModelFactory.gameViewModel()
        scene.connectViewModel(viewModel)
        rootNavigationController.pushViewController(scene, animated: true)
        return viewModel.backAction.values.producer
            .map { _ in return .cancel }
            .on(event: { [weak self] _ in self?.rootNavigationController.dismiss(animated: true) }
        )
    }
}
