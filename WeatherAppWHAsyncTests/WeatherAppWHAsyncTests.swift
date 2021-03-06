//
//  WeatherAppWHAsyncTests.swift
//  WeatherAppWHAsyncTests
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import XCTest
@testable import WeatherAppWH

class WeatherAppWHAsyncTests: XCTestCase {
    
    var sessionUnderTest : URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration : URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    // Slow failure Async test : RENT
    func testValidCallToDomainAPIGetsStatusCodeForRent200(){
        // Given
        //given
        let url = URL(string: "https://api.darksky.net/forecast/ad80056d07b06631617d455f0795b7bc/37.8267,-122.4233")
        let promise = expectation(description: "Status code : 200")
        
        // when
        sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            // then
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else{
                    XCTFail("Status code = \(statusCode)")
                }
            }
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    // Fast Fail : One consolidated call for both
    func testCallToDomainServerCompletes() {
        // Given
        let url = URL(string: "https://api.darksky.net/forecast/ad80056d07b06631617d455f0795b7bc/37.8267,-122.4233")
        let promise = expectation(description: "Call completes immediately by invoking completion handler")
        var statusCode : Int?
        var responseError : Error?
        
        // When
        sessionUnderTest.dataTask(with: url!) { (data, response, error) in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            }.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        // Then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
