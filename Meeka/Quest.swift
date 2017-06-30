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
    //Properties
    var status:         State
    var id:             Int
    var title:          String
    var description:    String
    var completedText:  String
    var points:         MMQPoints
    var penalty?:       MMQPoints
    
    
    //Init section
    init() {
        
    }
    
    //NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id,forKey:QuestPropertyKey.id)
        aCoder.encode(status, forKey: Quest)
    }
    
    // Subclasses
    class MMQPoints:NSObject,NSCoding {
        
        //Properties of a Points object
        var pawprint:   Int
        var fitness:    Int
        var body:       Int
        var mind:       Int
        var community:  Int
        var thriftiness:Int
        var soul:       Int
        
        //init section
        init?(coder aDecoder: NSCoder) {
            
        }
        
        func encode(with aCoder: NSCoder) {
            
        }
        
        
        
        
    }
    
    // Data defs
    enum State {
        case offered
        case accepted
        case declined
        case completed
        case forfeited
    }
}

struct QuestPropertyKey{
    static let status        = "status"
    static let id            = "id"
    static let title         = "title"
    static let description   = "desc"
    static let completedText = "comText"
    static let points        = "points"
    static let penalty       = "penalty"
}
