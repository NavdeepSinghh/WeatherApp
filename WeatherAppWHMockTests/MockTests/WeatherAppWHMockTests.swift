//
//  WeatherAppWHMockTests.swift
//  WeatherAppWHMockTests
//
//  Created by Navdeep  Singh on 5/29/17.
//  Copyright © 2017 Navdeep. All rights reserved.
//

import XCTest
@testable import WeatherAppWH

class WeatherAppWHMockTests: XCTestCase {
    var clientToTest : APIClient!
    
    override func setUp() {
        super.setUp()
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "Weather", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        
        //  session related information
        let url = URL (string: "https://api.darksky.net/forecast/ad80056d07b06631617d455f0795b7bc/37.8267,-122.4233")
        let urlResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        //  Create mock session using the above mentioned values
        //let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
        //clientToTest.downloader = JSONDownloader(session : sessionMock)
        
    }
    
    func testGetWeatherData(){
        //given
        let promise = expectation(description: "Status code: 200")
        
        var viewModel : CurrentWeatherViewModel!
        //when
        let location = Location(latitude: 33.8650, longitude: 151.2094)
        clientToTest.getWeather(at: location) { [unowned self] (currentWeather, error) in
            if let currentWeather = currentWeather {
                viewModel = CurrentWeatherViewModel(model: currentWeather)
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 4, handler: nil)
        
        //then
        XCTAssertEqual(viewModel.temperatute, "53" , "Couldn't parse properly")
    }
    
    override func tearDown() {
        clientToTest = nil
        super.tearDown()
    }
}
