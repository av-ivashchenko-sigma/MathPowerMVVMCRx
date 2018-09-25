import Swinject

class AssemblyDisposeToken {
    fileprivate let container: Container
    fileprivate init(_ container: Container) {
        self.container = container
    }
    func dispose() {
        Container.pop(container: container)
    }
    deinit {
        dispose()
    }
}

extension Container: Equatable {
    public static func == (lhs: Container, rhs: Container) -> Bool {
        return unsafeBitCast(lhs, to: UInt64.self) == unsafeBitCast(rhs, to: UInt64.self)
    }
}

extension Container {
    // swiftlint:disable:next force_cast
    private static var containerChain: [Container] = [Assembler.shared.resolver as! Container]
    fileprivate static func push(container: Container) {
        containerChain.append(container)
    }

    fileprivate static func pop(container: Container) {
        if let index = containerChain.index(of: container) {
            containerChain.remove(at: index)
        }
    }
    static var current: Container {
        return containerChain.last!
    }
}

extension Assembler: Equatable {
    public static func == (lhs: Assembler, rhs: Assembler) -> Bool {
        return unsafeBitCast(lhs, to: UInt64.self) == unsafeBitCast(rhs, to: UInt64.self)
    }
}

extension Assembler {
    private class LocalAssembly: Assembly {
        var wrappedAssembly: Assembly?
        var wrappedAssemblyClosure: ((Container) -> Void)?
        var container: Container!
        init(assembly: Assembly) {
            wrappedAssembly = assembly
        }
        init(assemblyClosure: @escaping (Container) -> Void) {
            wrappedAssemblyClosure = assemblyClosure
        }
        func assemble(container: Container) {
            self.container = Container(parent: container)
            if let assemblyClosure = wrappedAssemblyClosure {
                assemblyClosure(self.container)
            } else {
                wrappedAssembly?.assemble(container: self.container)
            }
        }
        func loaded(resolver: Resolver) {
            wrappedAssembly?.loaded(resolver: resolver)
        }
    }

    func applyDisposable(assembly: Assembly) -> AssemblyDisposeToken {
        assert(self == Assembler.shared, "Intended to work only within shared Assembler instance")
        return runLocalAssembly(LocalAssembly(assembly: assembly))
    }

    func applyDisposable(assemblyClosure: @escaping (Container) -> Void) -> AssemblyDisposeToken {
        assert(self == Assembler.shared, "Intended to work only within shared Assembler instance")
        return runLocalAssembly(LocalAssembly(assemblyClosure: assemblyClosure))
    }

    private func runLocalAssembly(_ localAssembly: LocalAssembly) -> AssemblyDisposeToken {
        Assembler.shared.apply(assembly: localAssembly)
        Container.push(container: localAssembly.container)
        return AssemblyDisposeToken(localAssembly.container)
    }
}

extension Assembler {
    static var shared = Assembler(assemblies)
}
