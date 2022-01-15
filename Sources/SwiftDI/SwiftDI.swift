import Foundation

public class Injectable: Identifiable {
    public var id: UUID

    required init() {
        id = UUID()
    }
}

@propertyWrapper
public struct Inject<T: Injectable> {
    lazy var value = T()

    public var wrappedValue: T {
        mutating get {
            value
        }
    }

    public init() {}
}

private var container: [String: Any] = [:]

@propertyWrapper
public struct InjectSingleton<T: Injectable> {
    lazy var value = T()

    public var wrappedValue: T {
        mutating get {
            if let value = container[String(describing: type(of: T.self))] as? T {
                return value
            }
            container[String(describing: type(of: T.self))] = value
            return container[String(describing: type(of: T.self))] as! T
        }
    }

    public init() {}
}
