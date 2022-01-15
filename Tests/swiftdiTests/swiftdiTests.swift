@testable import swiftdi
import XCTest

class ExampleInjectedService: Injectable {
    var text: String = "Hello, World!"
}

class ExampleService: Injectable {
    @Inject
    var injectedService: ExampleInjectedService

    func isAlive() -> Bool {
        return true
    }
}

final class swiftdiTests: XCTestCase {
    @Inject
    var service: ExampleService

    func testDidInitilized() throws {
        XCTAssertEqual(service.isAlive(), true)
        XCTAssertEqual(service.injectedService.text, "Hello, World!")
    }
}
