//
//  Meerkat.swift
//  Meeka
//
//  Created by Jakob Wedemeyer on 20/06/17.
//  Copyright © 2017 Mindful Meerkats. All rights reserved.
//

import Foundation
import CoreData

struct MeerkatPropertyKey {
    static let name = "name"
    static let id   = "id"
}

class Meerkat: NSObject, NSCoding{
    //Properties
    var name: String
    var id:   String
    
    
    // Serialization Part
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    init?() {
        // properties
        var nix = nil
        // let this init fail on certain conditions
        if somethingsomething {
            return nil
        }
        
    }
    
    
}
