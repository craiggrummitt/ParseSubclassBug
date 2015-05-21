//
//  CustomObject.swift
//  ParseStarterProject
//
//  Created by Craig on 21/05/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import Parse

class CustomObject:PFObject, PFSubclassing {
    
    @NSManaged var testString:String
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    static func parseClassName() -> String {
        return "CustomObject"
    }
}
