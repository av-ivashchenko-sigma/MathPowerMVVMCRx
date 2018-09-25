import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit
import Swinject

enum ScoreboardCoordinatorResult {
    case cancel
}

class ScoreboardCoordinator: Coordinator<ScoreboardCoordinatorResult> {
    private let rootNavigationController: UINavigationController
    private let screenFactory: ScreenFactoryProtocol = Container.current.resolve(ScreenFactoryProtocol.self)!
    private let viewModelFactory: ViewModelFactoryProtocol = Container.current.resolve(ViewModelFactoryProtocol.self)!
    private let coordinatorFactory: CoordinatorFactoryProtocol = Container.current.resolve(CoordinatorFactoryProtocol.self)!

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    override func start() -> SignalProducer<ScoreboardCoordinatorResult, NoError> {
        let (_, scene) = screenFactory.scoreboardScreen()
        let viewModel = viewModelFactory.scoreboardViewModel()
        scene.connectViewModel(viewModel)
        rootNavigationController.pushViewController(scene, animated: true)
        return viewModel.backAction.values.producer
            .map { _ in return .cancel }
            .on(event: { [weak self] _ in self?.rootNavigationController.dismiss(animated: true) }
        )
    }
}
