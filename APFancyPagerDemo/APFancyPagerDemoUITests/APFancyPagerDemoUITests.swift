//
//  APFancyPagerDemoUITests.swift
//  APFancyPagerDemoUITests
//
//  Created by Orhun Mert Şimşek on 3.05.2019.
//  Copyright © 2019 Apps. All rights reserved.
//

import XCTest

class APFancyPagerDemoUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        app = XCUIApplication()

        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSwipingAndTappingButtons() {
        
        XCTAssertFalse(app.buttons["RedButton"].exists)
        XCTAssertFalse(app.buttons["GreenButton"].exists)
        XCTAssertFalse(app.buttons["OrangeButton"].exists)
        
        XCTAssert(app.buttons["BlueButton"].exists)
        app.buttons["BlueButton"].tap()
        sleep(1)
        
        XCTAssert(app.buttons["RedButton"].exists)
        app.buttons["RedButton"].tap()
        sleep(1)
        
        XCTAssert(app.buttons["GreenButton"].exists)
        app.buttons["GreenButton"].tap()
        sleep(1)
        
        
        XCTAssert(app.buttons["OrangeButton"].exists)
        app.buttons["OrangeButton"].tap()
        sleep(1)
        
        XCTAssert(app.buttons["BlueButton"].exists)
        app.swipeLeft()
        XCTAssert(app.buttons["RedButton"].exists)
        app.swipeLeft()
        XCTAssert(app.buttons["GreenButton"].exists)
        app.swipeLeft()
        XCTAssert(app.buttons["OrangeButton"].exists)
        
        sleep(1)
        
        app.swipeRight()
        XCTAssert(app.buttons["GreenButton"].exists)
        app.swipeRight()
        XCTAssert(app.buttons["RedButton"].exists)
        app.swipeRight()
        XCTAssert(app.buttons["BlueButton"].exists)
        
        sleep(1)
        
        XCTAssert(app.buttons["BlueButton"].exists)
        app.buttons["BlueButton"].tap()
        sleep(1)
        
        XCTAssert(app.buttons["RedButton"].exists)
        app.buttons["RedButton"].tap()
        sleep(1)
        
        XCTAssert(app.buttons["GreenButton"].exists)
        app.buttons["GreenButton"].tap()
        sleep(1)
        
        
        XCTAssert(app.buttons["OrangeButton"].exists)
        app.buttons["OrangeButton"].tap()
        sleep(1)
        
    }

}
