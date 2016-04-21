//
//  CharacterAttribute.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/20/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

//public typealias AttributedCharacterRange = (attributes: CharacterAttributeSet, range: Range<String.CharacterView.Index>)

/**
 Enumerated type representing the various dictionary elements used with attributed string creation and manipulation.
*/
public enum CharacterAttribute {

    /**
     Attribute case corresponding to the dictionary key `NSFontAttributeName`.
     */
    case Font(UIFont)

    /**
     Attribute case corresponding to the dictionary key `NSParagraphStyleAttributeName`.
     */
    case ParagraphStyle(NSParagraphStyle)

    /**
     Attribute case corresponding to the dictionary key `NSForegroundColorAttributeName`.
     */
    case ForegroundColor(UIColor)

    /**
     Attribute case corresponding to the dictionary key `NSForegroundColorAttributeName`.
     */
    case BackgroundColor(UIColor)

    /**
     Attribute case corresponding to the dictionary key `NSLigatureAttributeName`.
     */
    case UseLigatures(Bool)

    /**
     Attribute case corresponding to the dictionary key `NSKernAttributeName`.
     */
    case Kern(CGFloat)

    /**
     Attribute case corresponding to the dictionary key `NSStrikethroughStyleAttributeName`.
     */
    case StrikethroughStyle(NSUnderlineStyle)

    /**
     Attribute case corresponding to the dictionary key `NSUnderlineStyleAttributeName`.
     */
    case UnderlineStyle(NSUnderlineStyle)

    /**
     Attribute case corresponding to the dictionary key `NSStrokeColorAttributeName`.
     */
    case StrokeColor(UIColor)

    /**
     Attribute case corresponding to the dictionary key `NSStrokeWidthAttributeName`.
     */
    case StrokeWidth(CGFloat)

    /**
     Attribute case corresponding to the dictionary key `NSShadowAttributeName`.
     */
    case Shadow(NSShadow)

    /**
     Attribute case corresponding to the dictionary key `NSTextEffectAttributeName`.
     */
    case TextEffect(String)

    /**
     Attribute case corresponding to the dictionary key `NSAttachmentAttributeName`.
     */
    case Attachment(NSTextAttachment)

    /**
     Attribute case corresponding to the dictionary key `NSLinkAttributeName`.
     */
    case Link(NSURL)

    /**
     Attribute case corresponding to the dictionary key `NSBaselineOffsetAttributeName`.
     */
    case BaselineOffset(CGFloat)

    /**
     Attribute case corresponding to the dictionary key `NSStrikethroughColorAttributeName`.
     */
    case StrikethroughColor(UIColor)

    /**
     Attribute case corresponding to the dictionary key `NSUnderlineColorAttributeName`.
     */
    case UnderlineColor(UIColor)

    /**
     Attribute case corresponding to the dictionary key `NSObliquenessAttributeName`.
     */
    case Obliqueness(CGFloat)

    /**
     Attribute case corresponding to the dictionary key `NSExpansionAttributeName`.
     */
    case Expansion(CGFloat)

    /**
     Attribute case corresponding to the dictionary key `NSWritingDirectionAttributeName`.
     */
    case WritingDirection([Int])

    /**
     Attribute case corresponding to the dictionary key `NSVerticalGlyphFormAttributeName`.
     */
    case UseVerticalGlyphForm(Bool)

    /**
     Initializes a new character attribute using the provided key and associated value.
     - parameter name: Must be a valid attribute dictionary key.
     - parameter value: Must be a valid instance of the appropriate associated type.
     */
    public init?(name: String, value: AnyObject) {
        switch name {
        case NSFontAttributeName:
            guard let font = value as? UIFont else { return nil }
            self = .Font(font)

        case NSParagraphStyleAttributeName:
            guard let style = value as? NSParagraphStyle else { return nil }
            self = .ParagraphStyle(style)

        case NSForegroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .ForegroundColor(color)

        case NSBackgroundColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .BackgroundColor(color)

        case NSLigatureAttributeName:
            guard let shouldUseLigatures = value as? Bool else { return nil }
            self = .UseLigatures(shouldUseLigatures)

        case NSKernAttributeName:
            guard let kern = value as? CGFloat else { return nil }
            self = .Kern(kern)

        case NSStrikethroughStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.integerValue) else { return nil }
            self = .StrikethroughStyle(style)

        case NSUnderlineStyleAttributeName:
            guard let boxedStyle = value as? NSNumber,
                let style = NSUnderlineStyle(rawValue: boxedStyle.integerValue) else { return nil }
            self = .UnderlineStyle(style)

        case NSStrokeColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .StrokeColor(color)

        case NSStrokeWidthAttributeName:
            guard let width = value as? CGFloat else { return nil }
            self = .StrokeWidth(width)

        case NSShadowAttributeName:
            guard let shadow = value as? NSShadow else { return nil }
            self = .Shadow(shadow)

        case NSTextEffectAttributeName:
            guard let effect = value as? String else { return nil }
            self = .TextEffect(effect)

        case NSAttachmentAttributeName:
            guard let attachment = value as? NSTextAttachment else { return nil }
            self = .Attachment(attachment)

        case NSLinkAttributeName:
            guard let link = value as? NSURL else { return nil }
            self = .Link(link)

        case NSBaselineOffsetAttributeName:
            guard let offset = value as? CGFloat else { return nil }
            self = .BaselineOffset(offset)

        case NSStrikethroughColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .StrikethroughColor(color)

        case NSUnderlineColorAttributeName:
            guard let color = value as? UIColor else { return nil }
            self = .UnderlineColor(color)

        case NSObliquenessAttributeName:
            guard let obliqueness = value as? CGFloat else { return nil }
            self = .Obliqueness(obliqueness)

        case NSExpansionAttributeName:
            guard let expansion = value as? CGFloat else { return nil }
            self = .Expansion(expansion)

        case NSWritingDirectionAttributeName:
            guard let overrides = value as? [Int] else { return nil }
            self = .WritingDirection(overrides)

        case NSVerticalGlyphFormAttributeName:
            guard let shouldUseVerticalGlyphForm = value as? Bool else { return nil }
            self = .UseVerticalGlyphForm(shouldUseVerticalGlyphForm)

        default:
            return nil
        }
    }

}


extension CharacterAttribute: Hashable {

    public var hashValue: Int {
        let (key, value) = keyValuePair
        return key.hashValue ^ value.hashValue
    }

}

public func ==(lhs: CharacterAttribute, rhs: CharacterAttribute) -> Bool {
    switch (lhs, rhs) {
    case let (.Font(font1), .Font(font2)):
        return font1 == font2

    case let (.ParagraphStyle(style1), .ParagraphStyle(style2)):
        return style1 == style2

    case let (.ForegroundColor(color1), .ForegroundColor(color2)):
        return color1 == color2

    case let (.BackgroundColor(color1), .BackgroundColor(color2)):
        return color1 == color2

    case let (.UseLigatures(flag1), .UseLigatures(flag2)):
        return flag1 == flag2

    case let (.Kern(kern1), .Kern(kern2)):
        return kern1 == kern2

    case let (.StrikethroughStyle(style1), .StrikethroughStyle(style2)):
        return style1 == style2

    case let (.UnderlineStyle(style1), .UnderlineStyle(style2)):
        return style1 == style2

    case let (.StrokeColor(color1), .StrokeColor(color2)):
        return color1 == color2

    case let (.StrokeWidth(width1), .StrokeWidth(width2)):
        return width1 == width2

    case let (.Shadow(shadow1), .Shadow(shadow2)):
        return shadow1 == shadow2

    case let (.TextEffect(effect1), .TextEffect(effect2)):
        return effect1 == effect2

    case let (.Attachment(attachment1), .Attachment(attachment2)):
        return attachment1 == attachment2

    case let (.Link(link1), .Link(link2)):
        return link1 == link2

    case let (.BaselineOffset(offset1), .BaselineOffset(offset2)):
        return offset1 == offset2

    case let (.StrikethroughColor(color1), .StrikethroughColor(color2)):
        return color1 == color2

    case let (.UnderlineColor(color1), .UnderlineColor(color2)):
        return color1 == color2

    case let (.Obliqueness(obliqueness1), .Obliqueness(obliqueness2)):
        return obliqueness1 == obliqueness2

    case let (.Expansion(expansion1), .Expansion(expansion2)):
        return expansion1 == expansion2

    case let (.WritingDirection(overrides1), .WritingDirection(overrides2)):
        return overrides1 == overrides2

    case let (.UseVerticalGlyphForm(useVertical1), .UseVerticalGlyphForm(useVertical2)):
        return useVertical1 == useVertical2

    default:
        return false
    }
}