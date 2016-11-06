//
//  ConstraintSubjectSwapping.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 6/19/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    /// This variable swaps the subjects in a constraint from the form `y R mx + b`, where `R` is a layout relation, to the form `x = (y - b) / m`, where `m != 0`
    public var swappedSubjectConstraint: NSLayoutConstraint? {
        guard subjectsCanBeSwapped else { return nil }

        let newConstraint = NSLayoutConstraint(
            item: secondItem!,
            attribute: secondAttribute,
            relatedBy: multiplier < 0 ? relation : relation.swapped,
            toItem: firstItem,
            attribute: firstAttribute,
            multiplier: 1 / multiplier,
            constant: -constant / multiplier
        )
        newConstraint.priority = priority

        return newConstraint
    }

    private var subjectsCanBeSwapped: Bool {
        return multiplier != 0.0 && secondItem != nil && secondAttribute != .notAnAttribute
    }

    /// Puts a constraint in a non-negative constant form, if possible, or returns itself if it is already in non-negative constant.
    public var positiveConstantConstraint: NSLayoutConstraint {
        guard constant < 0 else { return self }

        return swappedSubjectConstraint ?? self
    }
    
}

fileprivate extension NSLayoutRelation {

    var swapped: NSLayoutRelation {
        return NSLayoutRelation(rawValue: -rawValue)!
    }
    
}
