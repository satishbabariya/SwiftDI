# SwiftDI

SwiftDI is a dependency injection tool for Swift. With it you can build well-structured and easily testable applications for iOS

```swift
class ExampleInjectedService: Injectable {
    var text: String = "Hello, World!"
}

class ExampleService {
    @Inject
    var injectedService: ExampleInjectedService
}

```
