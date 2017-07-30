//
//  Meerkat.swift
//  Meeka
//
//  Created by Jakob Wedemeyer on 20/06/17.
//  Copyright © 2017 Mindful Meerkats. All rights reserved.
//

import Foundation
import CoreData
import os.log

struct MeerkatPropertyKey {
    static let name = "name"
    static let id   = "id"
    static let points = "points"
}

class Meerkat: NSObject, NSCoding{
    //Properties
    var name: String
    var id:   String
    var points: Points
    
    // Serialization Part
    
    func encode(with aCoder: NSCoder) {
        
    }
    
    init(name:String,id:String, points:Points) {
        self.name = name
        self.id   = id
        self.points = points
    }
    
    required convenience init?(coder mDec: NSCoder) {
            guard let id = mDec.decodeObject(forKey: MeerkatPropertyKey.id) as? String,
            let name = mDec.decodeObject(forKey: MeerkatPropertyKey.name) as? String,
            let points = mDec.decodeObject(forKey: MeerkatPropertyKey.points) as? Points
            else {
                os_log("Could not decode the Meerkat")
                return nil
            }
        self.init(name:name ,id:id, points:points)
    }
    
    
}
