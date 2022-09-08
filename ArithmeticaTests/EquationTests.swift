//
//  EquationTests.swift
//  EquationTests
//
//  Created by Max Mercer on 2022-09-01.
//

import XCTest
@testable import Arithmetica
//@testable import Equation


class EquationTests: XCTestCase {
    var sut : Equation!
    var lower_bound : Int = 0
    var upper_bound : Int = 100
    var operation : Operator = .addition
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Equation(lower_bound: lower_bound, upper_bound: upper_bound, operation: operation)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTermsExistInsideBounds() throws {
        for _ in 1...10{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertTrue(lower_bound <= term1 && term1 <= upper_bound)
            XCTAssertTrue(lower_bound <= term2 && term2 <= upper_bound)
        }
    }
    
    func testTermsAreCorrect() throws {
        let max = 10
        
        sut.operation = .subtraction
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertTrue(lower_bound <= term1 && term1 <= upper_bound)
            XCTAssertTrue(lower_bound <= term2 && term2 <= term1)
        }
        sut.operation = .division
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertTrue(lower_bound <= term1 && term1 <= upper_bound)
            XCTAssertTrue(lower_bound <= term2 && term2 <= term1)
            XCTAssertTrue(term2 != 0)
        }
    }
    
    func testCannotDivideByZero() throws {
        sut.operation = .division
        XCTAssertTrue(sut.lower_bound == 1)
        XCTAssertTrue(sut.lower_bound != 0)
    }
    
    func testEvaluate() throws {
        let max = 10
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertEqual(term1 + term2, sut.evaluate())
        }
        sut.operation = .subtraction
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertEqual(term1 - term2, sut.evaluate())
        }
        sut.operation = .multiplication
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertEqual(term1 * term2, sut.evaluate())
        }
        sut.operation = .division
        for _ in 1...max{
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertEqual(term1 / term2, sut.evaluate())
        }
    }

    func testPerformanceExample() throws {
        self.measure {
            let (term1, term2) = sut.generateNewTerms()
            XCTAssertEqual(term1 + term2, sut.evaluate())
        }
    }

}
