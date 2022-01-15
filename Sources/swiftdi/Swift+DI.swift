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
