//
//  HomeViewModeltest.swift
//  vee-marvelTests
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import XCTest
@testable import vee_marvel

class HomeViewModelTest: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUp() {
        viewModel = HomeViewModel()
        viewModel.service = HomeServiceSuccessMock()
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func testFetchData() {
        let expectation = self.expectation(description: "fetchData")
        viewModel.fetchData()
        expectation.fulfill()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNotNil(viewModel.characters)
    }
    
    func testLoadMoreCharacters(){
        let expectation = self.expectation(description: "fetchData")
        viewModel.fetchData()
        let count = viewModel.characters!.count
        viewModel.fetchData()
        expectation.fulfill()
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertTrue(viewModel.characters!.count > count)
    }

}
