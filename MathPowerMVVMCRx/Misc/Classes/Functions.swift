import Foundation

func weakify_0<Entity>(_ function: @escaping (Entity) -> () -> Void,
                       object: Entity) -> () -> Void where Entity: AnyObject {
    return { [weak object] in
        object.map { function($0)() }
    }
}

func weakify_1<Entity, P0>(_ function: @escaping (Entity) -> (P0) -> Void,
                           object: Entity) -> (P0) -> Void where Entity: AnyObject {
    return { [weak object] p0 in
        object.map { function($0)(p0) }
    }
}

func weakify_2<Entity, P0, P1>(_ function: @escaping (Entity) -> (P0, P1) -> Void,
                               object: Entity) -> (P0, P1) -> Void where Entity: AnyObject {
    return { [weak object] p0, p1 in
        object.map { function($0)(p0, p1) }
    }
}

func weakify_0_ret<Entity, Return>
    (_ function: @escaping (Entity) -> () -> Return,
     object: Entity) -> () -> Return? where Entity: AnyObject {
    return { [weak object] in
        object.map { function($0)() }
    }
}

func weakify_1_ret<Entity, P0, Return>
    (_ function: @escaping (Entity) -> (P0) -> Return,
     object: Entity) -> (P0) -> Return? where Entity: AnyObject {
    return { [weak object] p0 in
        object.map { function($0)(p0) }
    }
}

func weakify_2_ret<Entity, P0, P1, Return>
    (_ function: @escaping (Entity) -> (P0, P1) -> Return,
     object: Entity) -> (P0, P1) -> Return? where Entity: AnyObject {
    return { [weak object] p0, p1 in
        object.map { function($0)(p0, p1) }
    }
}

extension Optional {
    @discardableResult
    func unwrap<R>(_ function: @escaping (Wrapped) -> R) -> R? {
        if case .some(let wrapped) = self { return function(wrapped) }
        return nil
    }
}
