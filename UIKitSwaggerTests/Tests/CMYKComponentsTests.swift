//
//  CMYKComponentsTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 3/1/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

//  See `ColorTestHelpers.swift` for colors and values used herein.

class CMYKComponentsTests: XCTestCase {

    var components = CMYKComponents(
        cyan: randomCyanValue,
        magenta: randomMagentaValue,
        yellow: randomYellowValue,
        key: randomKeyValue,
        alpha: randomAlphaValue
    )

    var expectedCyan: CGFloat = 0
    var expectedMagenta: CGFloat = 0
    var expectedYellow: CGFloat = 0
    var expectedKey: CGFloat = 0

    func computeExpectedCMYKValuesForColor(_ color: UIColor) {
        let rgbComponents = color.rgbComponents
        let maximumValue = max(rgbComponents.red, rgbComponents.green, rgbComponents.blue)
        if maximumValue > 0 {
            expectedCyan = 1 - (rgbComponents.red / maximumValue)
            expectedMagenta = 1 - (rgbComponents.green / maximumValue)
            expectedYellow = 1 - (rgbComponents.blue / maximumValue)
            expectedKey = 1 - maximumValue
        }
        else {
            expectedCyan = 0
            expectedMagenta = 0
            expectedYellow = 0
            expectedKey = 1
        }
    }

    //  MARK: - Component values

    func testGettingCMYKComponentValues() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        var cyanValue: CGFloat = 0
        var magentaValue: CGFloat = 0
        var yellowValue: CGFloat = 0
        var keyValue: CGFloat = 0
        var alphaValue: CGFloat = 0
        let success =
        sampleRGBColor.getCyan(
            &cyanValue,
            magenta: &magentaValue,
            yellow: &yellowValue,
            key: &keyValue,
            alpha: &alphaValue
        )
        XCTAssertTrue(success, "The method should always return true")
        XCTAssertEqual(cyanValue, expectedCyan, "The cyan value should be correctly calculated")
        XCTAssertEqual(magentaValue, expectedMagenta, "The magenta value should be correctly calculated")
        XCTAssertEqual(yellowValue, expectedYellow, "The yellow value should be correctly calculated")
        XCTAssertEqual(keyValue, expectedKey, "The key value should be correctly calculated")
        XCTAssertEqual(alphaValue, randomAlphaValue, "The alpha value should be produced")
    }

    //  MARK: Cyan value

    func testCyanComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.cyanValue, expectedCyan, "The cyan component of the RGB color should be provided")
    }

    func testCyanComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.cyanValue, expectedCyan, "The cyan component of the HSB color should be provided")
    }

    func testCyanComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.cyanValue, 0, "The cyan component of the monochrome color should be provided")
    }

    //  MARK: Magenta value

    func testMagentaComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.magentaValue, expectedMagenta, "The magenta component of the RGB color should be provided")
    }

    func testMagentaComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.magentaValue, expectedMagenta, "The magenta component of the HSB color should be provided")
    }

    func testMagentaComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.magentaValue, 0, "The magenta component of the monochrome color should be provided")
    }

    //  MARK: Yellow value

    func testYellowComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.yellowValue, expectedYellow, "The yellow component of the RGB color should be provided")
    }

    func testYellowComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.yellowValue, expectedYellow, "The yellow component of the HSB color should be provided")
    }

    func testYellowComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.yellowValue, 0, "The yellow component of the monochrome color should be provided")
    }

    //  MARK: Key value

    func testKeyComponentWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        XCTAssertEqual(sampleRGBColor.keyValue, expectedKey, "The key component of the RGB color should be provided")
    }

    func testKeyComponentWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        XCTAssertEqual(sampleHSBColor.keyValue, expectedKey, "The alpha component of the HSB color should be provided")
    }

    func testKeyComponentWithMonochromeColor() {
        expectedKey = 1 - sampleMonochromeColor.white
        XCTAssertEqual(sampleMonochromeColor.keyValue, expectedKey, "The alpha component of the monochrome color should be provided")
    }

    //  MARK: Alpha value

    func testAlphaComponentWithRGBColor() {
        XCTAssertEqual(sampleRGBColor.alpha, randomAlphaValue, "The alpha component of the RGB color should be provided")
    }

    func testAlphaComponentWithHSBColor() {
        XCTAssertEqual(sampleHSBColor.alpha, randomAlphaValue, "The alpha component of the HSB color should be provided")
    }

    func testAlphaComponentWithMonochromeColor() {
        XCTAssertEqual(sampleMonochromeColor.alpha, randomAlphaValue, "The alpha component of the monochrome color should be provided")
    }

    //  MARK: - Components structure

    func testCMYKComponentStructureWithDefaultAlpha() {
        components = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue
        )
        XCTAssertEqual(components.cyan, randomCyanValue, "The components should include a cyan value")
        XCTAssertEqual(components.magenta, randomMagentaValue, "The components should include a magenta value")
        XCTAssertEqual(components.yellow, randomYellowValue, "The components should include a yellow value")
        XCTAssertEqual(components.key, randomKeyValue, "The components should include a key value")
        XCTAssertEqual(components.alpha, 1, "The components should use a default alpha value of 1")
    }

    func testCMYKComponentStructure() {
        XCTAssertEqual(components.cyan, randomCyanValue, "The components should include a cyan value")
        XCTAssertEqual(components.magenta, randomMagentaValue, "The components should include a magenta value")
        XCTAssertEqual(components.yellow, randomYellowValue, "The components should include a yellow value")
        XCTAssertEqual(components.key, randomKeyValue, "The components should include a key value")
        XCTAssertEqual(components.alpha, randomAlphaValue, "The components should include an alpha value")
    }

    //  MARK: Equality

    func testEqualityOfCMYKComponentStructure() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(components, moreComponents, "The components should be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedCyanValues() {
        let moreComponents = CMYKComponents(
            cyan: NudgeComponentValue(randomCyanValue),
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedMagentaValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: NudgeComponentValue(randomMagentaValue),
            yellow: randomYellowValue, 
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedYellowValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: NudgeComponentValue(randomYellowValue),
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedKeyValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: NudgeComponentValue(randomKeyValue),
            alpha: randomAlphaValue
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    func testInequalityOfCMYKComponentsWithMismatchedAlphaValues() {
        let moreComponents = CMYKComponents(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: NudgeComponentValue(randomAlphaValue)
        )
        XCTAssertNotEqual(components, moreComponents, "The components should not be considered equal")
    }

    //  MARK: Creating components from colors

    func testCMYKComponentsWithRGBColor() {
        computeExpectedCMYKValuesForColor(sampleRGBColor)
        components = CMYKComponents(
            cyan: expectedCyan,
            magenta: expectedMagenta,
            yellow: expectedYellow,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleRGBColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    func testCMYKComponentsWithHSBColor() {
        computeExpectedCMYKValuesForColor(sampleHSBColor)
        components = CMYKComponents(
            cyan: expectedCyan,
            magenta: expectedMagenta,
            yellow: expectedYellow,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleHSBColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    func testCMYKComponentsWithMonochromeColor() {
        expectedKey = 1 - sampleMonochromeColor.white
        components = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: expectedKey,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(sampleMonochromeColor.cmykComponents, components, "The cyan, magenta, yellow, key and alpha components of the color should be provided")
    }

    //  MARK: Reference colors

    func testCMYKComponentsWithBlackColor() {
        components = UIColor.black.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: 1,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Black should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithWhiteColor() {
        components = UIColor.white.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "White should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithRedColor() {
        components = UIColor.red.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 1,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Red should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithGreenColor() {
        components = UIColor.green.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 0,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Green should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithBlueColor() {
        components = UIColor.blue.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 1,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Blue should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithCyanColor() {
        components = UIColor.cyan.cmykComponents
        let expected = CMYKComponents(
            cyan: 1,
            magenta: 0,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Cyan should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithMagentaColor() {
        components = UIColor.magenta.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 1,
            yellow: 0,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Magenta should produce the appropriate CMYK components")
    }

    func testCMYKComponentsWithYellowColor() {
        components = UIColor.yellow.cmykComponents
        let expected = CMYKComponents(
            cyan: 0,
            magenta: 0,
            yellow: 1,
            key: 0,
            alpha: 1
        )
        XCTAssertEqual(components, expected, "Yellow should produce the appropriate CMYK components")
    }

    //  MARK: Creating colors from components

    func testColorCreationWithCMYKComponentValues() {
        let color = UIColor(
            cyan: randomCyanValue,
            magenta: randomMagentaValue,
            yellow: randomYellowValue,
            key: randomKeyValue,
            alpha: randomAlphaValue
        )
        XCTAssertEqual(color, components.rgbComponents.uiColor, "The component values should be used to create an instance of UIColor")
    }

    func testColorCreationWithCMYKComponents() {
        XCTAssertEqual(components.uiColor, components.rgbComponents.uiColor, "The components should create an instance of UIColor using its component values")
    }

}
