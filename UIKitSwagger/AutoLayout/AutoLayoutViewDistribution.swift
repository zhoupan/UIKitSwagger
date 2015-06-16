//
//  AutoLayoutViewDistribution.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

//  MARK: Left-to-right distribution

/**
  Convenience method for horizontally distributing two or more items without any spacing.
  The constraints that are applied use the left and right side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be horizontally distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeLeftToRight(views: UIView...)  -> [Constraint] {
    return DistributeLeftToRight(views)
}

/**
  Convenience method for horizontally distributing an array of items without any spacing.
  The constraints that are applied use the left and right side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be horizontally distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeLeftToRight(views: [UIView])  -> [Constraint] {
    return DistributeLeftToRight(spacing: 0, views: views)
}

/**
  Convenience method for horizontally distributing two or more items with constant spacing.
  The constraints that are applied use the left and right side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be horizontally distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeLeftToRight(spacing spacing: CGFloat, views: UIView...)  -> [Constraint] {
    return DistributeLeftToRight(spacing: spacing, views: views)
}

/**
  Convenience method for horizontally distributing an array of items with constant spacing.
  The constraints that are applied use the left and right side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be horizontally distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeLeftToRight(spacing spacing: CGFloat, views: [UIView])  -> [Constraint] {
    return DistributeViews(views, spacing: spacing, direction: .LeftToRight)
}

//  MARK: Leading-to-trailing distribution

/**
  Convenience method for horizontally distributing two or more items without any spacing.
  The constraints that are applied use the leading and trailing attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be horizontally distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeLeadingToTrailing(views: UIView...)  -> [Constraint] {
    return DistributeLeadingToTrailing(views)
}

/**
  Convenience method for horizontally distributing an array of items without any spacing.
  The constraints that are applied use the leading and trailing attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be horizontally distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeLeadingToTrailing(views: [UIView])  -> [Constraint] {
    return DistributeLeadingToTrailing(spacing: 0, views: views)
}

/**
  Convenience method for horizontally distributing two or more items with constant spacing.
  The constraints that are applied use the leading and trailing attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be horizontally distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeLeadingToTrailing(spacing spacing: CGFloat, views: UIView...)  -> [Constraint] {
    return DistributeLeadingToTrailing(spacing: spacing, views: views)
}

/**
  Convenience method for horizontally distributing an array of items with constant spacing.
  The constraints that are applied use the leading and trailing attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be horizontally distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeLeadingToTrailing(spacing spacing: CGFloat, views: [UIView])  -> [Constraint] {
    return DistributeViews(views, spacing: spacing, direction: .LeadingToTrailing)
}

//  MARK: Top-to-bottom distribution

/**
  Convenience method for vertically distributing two or more items without any spacing.
  The constraints that are applied use the top and bottom side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be vertically distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeTopToBottom(views: UIView...)  -> [Constraint] {
    return DistributeTopToBottom(views)
}

/**
  Convenience method for vertically distributing an array of items without any spacing.
  The constraints that are applied use the top and bottom side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be vertically distributed.
  :returns:     The constraints that were applied.
*/
public func DistributeTopToBottom(views: [UIView])  -> [Constraint] {
    return DistributeTopToBottom(spacing: 0, views: views)
}

/**
  Convenience method for vertically distributing two or more items with constant spacing.
  The constraints that are applied use the top and bottom side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views Two or more items that are to be vertically distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeTopToBottom(spacing spacing: CGFloat, views: UIView...)  -> [Constraint] {
    return DistributeTopToBottom(spacing: spacing, views: views)
}

/**
  Convenience method for vertically distributing an array of items with constant spacing.
  The constraints that are applied use the top and bottom side attributes of the views.
  The layout constraints created by this function are applied to the appropriate view.
  If fewer than two items are provided, an error is thrown.

  :param:       views An array of two or more items that are to be vertically distributed.
  :param:       spacing Constant to use for spacing between the views.
  :returns:     The constraints that were applied.
*/
public func DistributeTopToBottom(spacing spacing: CGFloat, views: [UIView])  -> [Constraint] {
    return DistributeViews(views, spacing: spacing, direction: .TopToBottom)
}
