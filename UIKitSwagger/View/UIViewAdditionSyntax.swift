//
//  UIViewAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/5/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public protocol UIViewAddable { }

extension UIView: UIViewAddable { }
extension NSLayoutConstraint: UIViewAddable { }
extension UIMotionEffect: UIViewAddable { }
extension UIGestureRecognizer: UIViewAddable { }

public typealias UIViewRemovable = UIViewAddable


/**
  An operator used to add a subview, auto layout constraint, motion effect or gesture recognizer to a view.
*/
public func +=(view: UIView, addable: UIViewAddable) {
    switch addable {
    case let subview as UIView:
        view.addSubview(subview)

    case let constraint as NSLayoutConstraint:
        view.addConstraint(constraint)

    case let effect as UIMotionEffect:
        view.addMotionEffect(effect)

    case let recognizer as UIGestureRecognizer:
        view.addGestureRecognizer(recognizer)

    default:
        break
    }
}

/**
  An operator used to add an array of subviews, auto layout constraints, motion effects and gesture recognizers to a view.
  The order in which the items are applied is not necessarily the order in which they are provided in the array.
  This is done to avoid adding constraints for which the view is unprepared.
*/
public func +=(view: UIView, addables: [UIViewAddable]) {
    groupAddables(addables).map { view += $0 }
}

/**
  An operator used to remove a subview, auto layout constraint, motion effect or gesture recognizer from a view.
*/
public func -=(view: UIView, removable: UIViewRemovable) {
    switch removable {
    case let subview as UIView:
        subview.removeFromSuperview()

    case let constraint as NSLayoutConstraint:
        view.removeConstraint(constraint)

    case let effect as UIMotionEffect:
        view.removeMotionEffect(effect)

    case let recognizer as UIGestureRecognizer:
        view.removeGestureRecognizer(recognizer)

    default:
        break
    }
}

/**
  An operator used to remove an array of subviews, auto layout constraints, motion effects and gesture recognizers from a view.
  The order in which the items are removed is not necessarily the order in which they are provided in the array.
  This is done to avoid leaving invalid constraints in the view.
*/
public func -=(view: UIView, removables: [UIViewRemovable]) {
    groupAddables(removables).map { view -= $0 }
}


////////////////////////////////////////////////////////////////////////////////

private func groupAddables(addables: [UIViewAddable]) -> [UIViewAddable] {
    var views = [UIViewAddable]()
    var constraints = [UIViewAddable]()
    var effects = [UIViewAddable]()
    var recognizers = [UIViewAddable]()

    for addable in addables {
        switch addable {
        case let view as UIView:
            views.append(view)

        case let constraint as NSLayoutConstraint:
            constraints.append(constraint)

        case let effect as UIMotionEffect:
            effects.append(effect)

        case let recognizer as UIGestureRecognizer:
            recognizers.append(recognizer)

        default:
            break
        }
    }

    return views + constraints + effects + recognizers
}
