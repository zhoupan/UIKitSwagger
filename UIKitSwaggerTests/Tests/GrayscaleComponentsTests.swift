//
//  GrayscaleComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

//  See `ColorTestHelpers.swift` for colors and values used herein.

class GrayscaleComponentsTests: XCTestCase {

    var components =
    UIColorGrayscaleComponents(
        white: randomWhiteValue,
        alpha: randomAlphaValue
    )

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testGrayscaleComponentStructureWithDefaultAlpha() {
        components = UIColorGrayscaleComponents(white: randomWhiteValue)
        XCTAssertEqual(components.white, randomWhiteValue, "The components should include a white value")
        XCTAssertEqual(components.alpha, 1.0, "The components should use a default alpha value of 1.0")
    }

    func testGrayscaleComponentStructure() {
        XCTAssertEqual(components.white, randomWhiteValue, "The components should include a white value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK: Equality

    func testEqualityOfGrayscaleComponentStructure() {
        let moreComponents = UIColorGrayscaleComponents(white: randomWhiteValue, alpha: randomAlphaValue)
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedWhiteValues() {
        let moreComponents = UIColorGrayscaleComponents(white: nudgeComponentValue(randomWhiteValue), alpha: randomAlphaValue)
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfGrayscaleComponentsWithMismatchedAlphaValues() {
        let moreComponents = UIColorGrayscaleComponents(white: randomWhiteValue, alpha: nudgeComponentValue(randomAlphaValue))
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Components from colors

    func testGrayscaleComponentsWithRGBColor() {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleRGBColor.getWhite(&whiteValue, alpha: &alphaValue)
        components = UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
        XCTAssertEqual(sampleRGBColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithHSBColor() {
        var whiteValue = CGFloat(0)
        var alphaValue = CGFloat(0)
        sampleHSBColor.getWhite(&whiteValue, alpha: &alphaValue)
        components = UIColorGrayscaleComponents(white: whiteValue, alpha: alphaValue)
        XCTAssertEqual(sampleHSBColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    func testGrayscaleComponentsWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.grayscaleComponents, components, "The white and alpha components of the color should be provided")
    }

    //  MARK: Colors from components

    func testNonComponentsCreatesColorWithAllZeroGrayscaleValues() {
        let color = UIColor(components: NonComponents())
        let expected = UIColor(white: 0.0, alpha: 0.0)
        components = UIColorGrayscaleComponents(white: 0.0, alpha: 0.0)
        XCTAssertEqual(color.grayscaleComponents, components, "The color produced for unknown types conforming to `UIColorComponents` should have all zeros for component values")
    }

    func testColorCreationWithGrayscaleComponents() {
        let color = components.color()
        XCTAssertEqual(color, sampleMonochromeColor, "The components should create an instance of UIColor using the same values")
    }

    func testGrayscaleComponentsUIColorInitializer() {
        let color = UIColor(components: components)
        XCTAssertEqual(color, sampleMonochromeColor, "The initializer should use the provided component values")
    }

    //  MARK: Component values

    func testWhiteComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.white, sampleRGBColor.grayscaleComponents.white, "The white component of the RGB color should be provided")
    }

    func testWhiteComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.white, sampleHSBColor.grayscaleComponents.white, "The white component of the HSB color should be provided")
    }

    func testWhiteComponentWithMonochromeColor() {
        XCTAssertEqualWithAccuracy(sampleMonochromeColor.white, randomWhiteValue, ColorComponentValueTestAccuracy, "The white component of the monochrome color should be provided")
    }

}
