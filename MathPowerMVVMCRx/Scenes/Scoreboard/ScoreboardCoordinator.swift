import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

enum ScoreboardCoordinatorResult {
    case cancel
}

class ScoreboardCoordinator: Coordinator<ScoreboardCoordinatorResult> {
    private let rootNavigationController: UINavigationController
    private let screenFactory: ScreenFactoryProtocol
    private let viewModelFactory: ViewModelFactoryProtocol

    init(rootNavigationController: UINavigationController, screenFactory: ScreenFactoryProtocol, viewModelFactory: ViewModelFactoryProtocol) {
        self.rootNavigationController = rootNavigationController
        self.screenFactory = screenFactory
        self.viewModelFactory = viewModelFactory
    }

    override func start() -> SignalProducer<ScoreboardCoordinatorResult, NoError> {
        let (_, scene) = screenFactory.menuScreen()
        let viewModel = viewModelFactory.scoreboardViewModel()
        scene.connectViewModel(viewModel)
        rootNavigationController.pushViewController(scene, animated: true)
        return viewModel.backAction.values.producer
            .map { _ in return .cancel }
            .on(event: { [weak self] _ in self?.rootNavigationController.dismiss(animated: true) }
        )
    }
}
