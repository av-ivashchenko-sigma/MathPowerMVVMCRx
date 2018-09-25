import ReactiveSwift
import ReactiveCocoa
import Result
import UIKit
import Swinject

enum StartGameCoordinatorResult {
    case cancel
}

class StartGameCoordinator: Coordinator<StartGameCoordinatorResult> {
    private let rootNavigationController: UINavigationController
    private let screenFactory: ScreenFactoryProtocol = Container.current.resolve(ScreenFactoryProtocol.self)!
    private let viewModelFactory: ViewModelFactoryProtocol = Container.current.resolve(ViewModelFactoryProtocol.self)!
    private let coordinatorFactory: CoordinatorFactoryProtocol = Container.current.resolve(CoordinatorFactoryProtocol.self)!

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    override func start() -> SignalProducer<StartGameCoordinatorResult, NoError> {
        let (_, scene) = screenFactory.startGameScreen()
        let viewModel = viewModelFactory.startGameViewModel()

        viewModel.startAction.completed.observeValues { [weak self] _ in self?.showGame() }

        scene.connectViewModel(viewModel)
        rootNavigationController.pushViewController(scene, animated: true)
        return viewModel.backAction.values.producer
            .map { _ in return .cancel }
            .on(event: { [weak self] _ in self?.rootNavigationController.dismiss(animated: true) }
        )
    }
}

extension StartGameCoordinator {
    func showGame() {
        let gameCoordinator = coordinatorFactory.gameCoordinator(rootNavigationController: rootNavigationController)
        coordinate(to: gameCoordinator).start()
    }
}
