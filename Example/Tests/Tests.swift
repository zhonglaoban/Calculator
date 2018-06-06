import XCTest
import Calculator

class Tests: XCTestCase {
    let calculator = Calculator()
    
    override func setUp() {
        super.setUp()
        calculator.reset()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSumTwoInt() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "2.0")
        }
        calculator.calculate("1")
        calculator.calculate("+")
        calculator.calculate("1")
        calculator.calculate("=")
    }
    func testSumThreeInt() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "3.0")
        }
        calculator.calculate("1")
        calculator.calculate("+")
        calculator.calculate("1")
        calculator.calculate("+")
        calculator.calculate("1")
        calculator.calculate("=")
    }
    func testSumTwoFloat() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "13.5")
        }
        calculator.calculate("1.2")
        calculator.calculate("+")
        calculator.calculate("12.3")
        calculator.calculate("=")
    }
    func testSumThreeFloat() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "16.8")
        }
        calculator.calculate("1.2")
        calculator.calculate("+")
        calculator.calculate("12.3")
        calculator.calculate("+")
        calculator.calculate("3.3")
        calculator.calculate("=")
    }
    func testTwoIntSubtract() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "8.0")
        }
        calculator.calculate("18")
        calculator.calculate("-")
        calculator.calculate("10")
        calculator.calculate("=")
    }
    func testThreeIntSubtract() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "6.0")
        }
        calculator.calculate("18")
        calculator.calculate("-")
        calculator.calculate("10")
        calculator.calculate("-")
        calculator.calculate("2")
        calculator.calculate("=")
    }
    func testTwoFloatSubtract() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "9.8")
        }
        calculator.calculate("10.8")
        calculator.calculate("-")
        calculator.calculate("1.0")
        calculator.calculate("=")
    }
    func testThreeFloatSubtract() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "-1.4")
        }
        calculator.calculate("10.8")
        calculator.calculate("-")
        calculator.calculate("10")
        calculator.calculate("-")
        calculator.calculate("2.2")
        calculator.calculate("=")
    }
    func testMultiplyingTwoInt() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "24.0")
        }
        calculator.calculate("12")
        calculator.calculate("x")
        calculator.calculate("2")
        calculator.calculate("=")
    }
    func testMultiplyingThreeInt() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "48.0")
        }
        calculator.calculate("12")
        calculator.calculate("x")
        calculator.calculate("2")
        calculator.calculate("x")
        calculator.calculate("2")
        calculator.calculate("=")
    }
    func testMultiplyingTwoFloat() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "2.88")
        }
        calculator.calculate("1.2")
        calculator.calculate("x")
        calculator.calculate("2.4")
        calculator.calculate("=")
    }
    func testMultiplyingThreeFloat() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "1.44")
        }
        calculator.calculate("1.2")
        calculator.calculate("x")
        calculator.calculate("2.4")
        calculator.calculate("x")
        calculator.calculate("0.5")
        calculator.calculate("=")
    }
    func testTwoIntDivide() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "5.0")
        }
        calculator.calculate("15")
        calculator.calculate("/")
        calculator.calculate("3")
        calculator.calculate("=")
    }
    func testThreeIntDivide() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "1.0")
        }
        calculator.calculate("15")
        calculator.calculate("/")
        calculator.calculate("3")
        calculator.calculate("/")
        calculator.calculate("5")
        calculator.calculate("=")
    }
    func testTwoFloatDivide() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "2.0")
        }
        calculator.calculate("2.4")
        calculator.calculate("/")
        calculator.calculate("1.2")
        calculator.calculate("=")
    }
    func testThreeFloatDivide() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "4.0")
        }
        calculator.calculate("2.4")
        calculator.calculate("/")
        calculator.calculate("1.2")
        calculator.calculate("/")
        calculator.calculate("0.5")
        calculator.calculate("=")
    }
    func testDivideZero() {
        // Given
        // When
        // Then
        calculator.didFinishCalculateBlock = {result in
            XCTAssertEqual(result, "错误")
        }
        calculator.calculate("3")
        calculator.calculate("/")
        calculator.calculate("0")
        calculator.calculate("=")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
