import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit

enum StartGameCoordinatorResult {
    case cancel
}

class StartGameCoordinator: Coordinator<StartGameCoordinatorResult> {
    private let rootNavigationController: UINavigationController
    private let screenFactory: ScreenFactoryProtocol
    private let viewModelFactory: ViewModelFactoryProtocol

    init(rootNavigationController: UINavigationController, screenFactory: ScreenFactoryProtocol, viewModelFactory: ViewModelFactoryProtocol) {
        self.rootNavigationController = rootNavigationController
        self.screenFactory = screenFactory
        self.viewModelFactory = viewModelFactory
    }

    override func start() -> SignalProducer<StartGameCoordinatorResult, NoError> {
        let (_, scene) = screenFactory.startGameScreen()
        let viewModel = viewModelFactory.startGameViewModel()
        scene.connectViewModel(viewModel)
        rootNavigationController.pushViewController(scene, animated: true)
        return viewModel.backAction.values.producer
            .map { _ in return .cancel }
            .on(event: { [weak self] _ in self?.rootNavigationController.dismiss(animated: true) }
        )
    }
}
