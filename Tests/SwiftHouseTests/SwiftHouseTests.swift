import XCTest
@testable import SwiftHouse

final class SwiftHouseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      
        let client = SwiftyHouse.init(baseUrl: "http://localhost:32773/", database: "comandero")
        
        
        if let result = client.query(query: "SELECT * FROM comanda LIMIT 2"){
            print("result: \(result)")
        }
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
