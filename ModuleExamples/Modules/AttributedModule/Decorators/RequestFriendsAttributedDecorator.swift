//
//  RequestFriendsAttributedDecorator.swift
//  ModuleExamples
//
//  Created by Francisco Javier Trujillo Mata on 12/12/2018.
//  Copyright © 2018 Francisco Javier Trujillo Mata. All rights reserved.
//

import UIKit

class RequestFriendsAttributedDecorator: CommonAttributedDecorator {
    override func attributedTitle() -> NSAttributedString? {
        let attr = NSMutableAttributedString()
        attr.append(mainAttributedInfo)
        attr.append(attributedBreakLine)
        attr.append(descAttributedInfo)
        
        return attr
    }
}

//MARK: - RequestFriendsAttributedDecorator
private extension RequestFriendsAttributedDecorator {
    
    var mainColor : UIColor {
        return UIColor.black
    }
    
    var softColor : UIColor {
        return UIColor.gray
    }
    
    var mainFont : UIFont {
        return UIFont.boldSystemFont(ofSize:15)
    }
    
    var secondaryFont : UIFont {
        return UIFont.systemFont(ofSize:13)
    }
    
    var alternativeFont : UIFont {
        return UIFont.systemFont(ofSize:15)
    }
    
    var smalFont : UIFont {
        return UIFont.systemFont(ofSize:9)
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
            NSAttributedString.Key.foregroundColor : softColor,
        ]
    }
    
    var alternativeAttributes : [NSAttributedString.Key : Any] {
        
        return [
            NSAttributedString.Key.font : alternativeFont,
            NSAttributedString.Key.foregroundColor : mainColor,
        ]
    }
    
    var smallAttributes : [NSAttributedString.Key : Any] {
        
        return [
            NSAttributedString.Key.font : smalFont,
            NSAttributedString.Key.foregroundColor : mainColor,
        ]
    }
    
    var attributedBreakLine : NSAttributedString {
        return NSAttributedString(string: "\n", attributes:smallAttributes)
    }
    
    var requestFriendAttributedIcon : NSAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "requestFriend")
        changeAttachmentImageHeight(attachment: imageAttachment, height: mainFont.pointSize)
        
        return NSAttributedString(attachment: imageAttachment)
    }
    
    var mainAttributedInfo : NSAttributedString {
        let attr = NSMutableAttributedString()
        attr.append(NSAttributedString(string: "Miguél Ángel Gutiérrez, Elena Benítez ", attributes: mainAttributes))
        attr.append(NSAttributedString(string: "and other 3 accepted your friend requests.", attributes: alternativeAttributes))
        return attr
    }
    
    var descAttributedInfo : NSAttributedString {
        let attr = NSMutableAttributedString()
        attr.append(requestFriendAttributedIcon)
        attr.append(NSAttributedString(string: " Wednesday at 19:25.", attributes: softAttributes))
        return attr
    }
}

