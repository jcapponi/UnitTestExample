//
//  ValidationServiceTests.swift
//  UnitTesting Tests
//
//  Created by Juan Capponi on 11/30/20.
//

@testable import UnitTesting
import XCTest


class ValidationServiceTests: XCTestCase {

    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUserName("jhon"))
    }

    func test_username_is_nil() throws {
        //verifying the exact error we're checking
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUserName(nil)) {
            thrownError in
            error = thrownError as? ValidationError
            
            XCTAssertEqual(expectedError, error)
        }
    }
 
    
    func test_username_is_tooShort() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUserName("mmb")) {
            thrownError in
            error = thrownError as? ValidationError
            
        XCTAssertEqual(expectedError, error)
        }
    }

    
    func test_username_is_tooLong() throws {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        let username = "TooLongUserName"
        
        XCTAssertTrue(username.count == 15)
        
        XCTAssertThrowsError(try validation.validateUserName(username)) {
            thrownError in
            error = thrownError as? ValidationError
            
        XCTAssertEqual(expectedError, error)
        }
    }

    
    
}
