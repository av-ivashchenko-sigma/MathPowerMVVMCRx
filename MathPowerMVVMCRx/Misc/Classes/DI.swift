import Swinject
import SwinjectAutoregistration

private struct UtilityServicesAssembly: Assembly {
    func assemble(container: Container) {
    }
}

private struct DomainServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ScoreboardDomainServiceProtocol.self, initializer: ScoreboardDomainService.init).inObjectScope(.container)
    }
}

private struct FactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ViewModelFactoryProtocol.self, initializer: ViewModelFactory.init).inObjectScope(.container)
        container.autoregister(ScreenFactoryProtocol.self, initializer: ScreenFactory.init).inObjectScope(.container)
        container.autoregister(CoordinatorFactoryProtocol.self, initializer: CoordinatorFactory.init).inObjectScope(.container)
    }
}

public let assemblies: [Assembly] = [
    UtilityServicesAssembly(),
    DomainServicesAssembly(),
    FactoryAssembly()
]
