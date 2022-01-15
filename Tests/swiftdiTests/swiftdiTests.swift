@testable import SwiftDI
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

final class SwiftDITests: XCTestCase {
    @Inject
    var service: ExampleService

    @Inject
    var service2: ExampleService

    @InjectSingleton
    var singleInstance: ExampleService

    @InjectSingleton
    var singleInstance2: ExampleService

    func testDidInitilized() throws {
        XCTAssertEqual(service.isAlive(), true)
        XCTAssertEqual(service.injectedService.text, "Hello, World!")
    }

    func testDidInitilizedSingleton() throws {
        XCTAssertEqual(singleInstance.isAlive(), true)
        XCTAssertEqual(singleInstance.injectedService.text, "Hello, World!")
    }

    func testSingleton() throws {
        XCTAssertNotEqual(service.id, service2.id)
        XCTAssertEqual(singleInstance.id, singleInstance2.id)
    }
}
