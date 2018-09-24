import ReactiveSwift
import ReactiveCocoa
import Result
import Foundation

class Coordinator<ResultType> {

    typealias CoordinationResult = ResultType

    private let identifier = UUID()

    private var childCoordinators = [UUID: Any]()

    private func store<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func free<T>(coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }

    func coordinate<T>(to coordinator: Coordinator<T>) -> SignalProducer<T, NoError> {
        store(coordinator: coordinator)
        return coordinator.start().on(completed: { [weak self] in self?.free(coordinator: coordinator) })
    }

    func start() -> SignalProducer<ResultType, NoError> {
        fatalError("Start method should be implemented.")
    }
}
