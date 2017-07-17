//
//  Quest.swift
//  Meeka
//
//  Created by Jakob Wedemeyer on 20/06/17.
//  Copyright © 2017 Mindful Meerkats. All rights reserved.
//

import Foundation
import CoreData
import os.log

class Quest:NSObject,NSCoding {
    //Properties
    var status:         State
    var id:             Int
    var title:          String
    var desc:           String
    var completedText:  String
    var points:         MMQPoints
    var penalty:        MMQPoints? //don't really know if used
    
    
    //Init section
    init(id: Int, status:State ,title: String, desc: String, completedText: String, points: MMQPoints, penalty: MMQPoints?) {
        self.id             = id
        self.status         = status
        self.title          = title
        self.desc           = desc
        self.completedText  = completedText
        self.points         = points
        self.penalty        = penalty
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let id = aDecoder.decodeObject(forKey: QuestPropertyKey.id) as? Int else { os_log("Could not decode ID") }
        guard let status = aDecoder.decodeObject(forKey: QuestPropertyKey.status) as? State  else { os_log("Could not decode Status") }
        guard let title = aDecoder.decodeObject(forKey: QuestPropertyKey.title) as? String else { os_log("Could not decode Title") }
        guard let desc = aDecoder.decodeObject(forKey: QuestPropertyKey.desc) as? String else { os_log("Could not decode Desc") }
        guard let completedText = aDecoder.decodeObject(forKey: QuestPropertyKey.completedText) as? String else { os_log("Could not decode Completed Text") }
        guard let points = aDecoder.decodeObject(forKey: QuestPropertyKey.points) as? MMQPoints else { os_log("Could not decode Points") }
        let penalty = aDecoder.decodeObject(forKey: QuestPropertyKey.penalty) as? MMQPoints
        
        self.init(id:id, status:status,desc:desc,completedText:completedText,points:points, penalty:penalty)
        
    }
    
    //NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id,forKey:QuestPropertyKey.id)
        aCoder.encode(status, forKey: QuestPropertyKey.status)
        aCoder.encode(title, forKey: QuestPropertyKey.title)
        aCoder.encode(desc, forKey: QuestPropertyKey.desc)
        aCoder.encode(completedText, forKey: QuestPropertyKey.completedText)
        aCoder.encode(points, forKey: QuestPropertyKey.points)
        aCoder.encode(penalty, forKey: QuestPropertyKey.penalty)
        
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
        required init?(coder aDecoder: NSCoder) {
            
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
    static let desc          = "desc"
    static let completedText = "comText"
    static let points        = "points"
    static let penalty       = "penalty"
}
