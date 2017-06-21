//
//  Quest.swift
//  Meeka
//
//  Created by Jakob Wedemeyer on 20/06/17.
//  Copyright © 2017 Mindful Meerkats. All rights reserved.
//

import Foundation
import CoreData

class Quest:NSObject,NSCoding {
    
    var title:          String
    var description:    String
    var completedText:  String
    var points:         MMQPoints
    var penalty?:       MMQPoints
 
    class MMQPoints:NSObject,NSCoding {
        var pawprint
        var fitness
        var 
    }
}
