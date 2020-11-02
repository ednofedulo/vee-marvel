//
//  vee_marvelUITests.swift
//  vee-marvelUITests
//
//  Created by Edno Fedulo on 30/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import XCTest
@testable import vee_marvel

class vee_marvelUITests: XCTestCase {

    func testNavigation() {
        let app = XCUIApplication()
        app.launch()
        _ = app.tables.firstMatch.waitForExistence(timeout: 5)
        app.tables.staticTexts["3-D Man"].tap()
        
        XCTAssert(app.navigationBars.staticTexts["3-D Man"].exists)
        
        let scrollViewsQuery = app.scrollViews
        XCTAssert(scrollViewsQuery.otherElements.images["characterImage"].exists)
                
    }
    
    func testLoadMore() {
        let app = XCUIApplication()
        app.launch()
        _ = app.tables.firstMatch.waitForExistence(timeout: 5)
        let firstCount = app.tables.staticTexts.count
        app.tables.firstMatch.swipeUp()
        let afterCount = app.tables.staticTexts.count
        XCTAssertTrue(afterCount > firstCount)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
