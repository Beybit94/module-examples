//
//  FavoriteMusicAttributedDecorator.swift
//  ModuleExamples
//
//  Created by Francisco Javier Trujillo Mata on 27/04/2019.
//  Copyright © 2019 Francisco Javier Trujillo Mata. All rights reserved.
//

import UIKit

class FavoriteMusicAttributedDecorator: CommonAttributedDecorator {
    override func attributedTitle() -> NSAttributedString? {
        let attr = NSMutableAttributedString()
        attr.append(attributedRadioIcon)
        attr.append(attributedBreakLine)
        attr.append(attributedBreakLine)
        attr.append(attributedDescription)
        
        return attr.copy() as? NSAttributedString
    }
}

//MARK: - FavoriteMusicAttributedDecorator
private extension FavoriteMusicAttributedDecorator {
    var mainColor : UIColor {
        return UIColor.black
    }
    
    var mainFont : UIFont {
        return UIFont.boldSystemFont(ofSize:25)
    }
    
    var secondaryFont : UIFont {
        return UIFont.systemFont(ofSize:14)
    }
    
    var smalFont : UIFont {
        return UIFont.systemFont(ofSize:9)
    }
    
    var paragraph : NSParagraphStyle {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        return paragraph.copy() as! NSParagraphStyle
    }
    
    
    var mainAttributes : [NSAttributedString.Key : Any] {
        
        return [
            NSAttributedString.Key.font : mainFont,
            NSAttributedString.Key.foregroundColor : mainColor,
        ]
    }
    
    var softAttributes : [NSAttributedString.Key : Any] {
        
        return [
            NSAttributedString.Key.font : secondaryFont,
            NSAttributedString.Key.foregroundColor : mainColor,
            NSAttributedString.Key.paragraphStyle : paragraph,
        ]
    }
    
    var smallAttributes : [NSAttributedString.Key : Any] {
        
        return [
            NSAttributedString.Key.font : smalFont,
        ]
    }
    
    var attributedBreakLine : NSAttributedString {
        return NSAttributedString(string: "\n", attributes:smallAttributes)
    }
    
    var attributedRadioIcon : NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "radioIcon")
        changeAttachmentImageHeight(attachment: imageAttachment, height: mainFont.pointSize)
        
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.paragraphStyle: paragraph]
        let radioIconAttributed = NSMutableAttributedString(attachment: imageAttachment)
        radioIconAttributed.addAttributes(attributes, range: NSRange(location: 0, length: radioIconAttributed.length))
        
        return radioIconAttributed.copy() as! NSAttributedString
    }
    
    var attributedDescription : NSAttributedString {
        return NSAttributedString(string: "What music do you listen to? Add songs to your profile to show people your tastes and how you are.", attributes: softAttributes)
    }
}
