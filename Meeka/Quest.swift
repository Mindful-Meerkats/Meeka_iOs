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

class Quest: NSObject, NSCoding {
	//Properties
	var status: State
	var id: Int
	var title: String
	var desc: String
	var completedText: String
	var points: Points
	var penalty: Points? //don't really know if used


	//Init section
	init(id: Int, status: State, title: String, desc: String, completedText: String, points: Points, penalty: Points?) {
		self.id = id
		self.status = status
		self.title = title
		self.desc = desc
		self.completedText = completedText
		self.points = points
		self.penalty = penalty

	}

	required convenience init?(coder aDecoder: NSCoder) {
		guard let id = aDecoder.decodeObject(forKey: QuestPropertyKey.id) as? Int else { os_log("couldn't decode quest from CoreData"); return nil}
        guard let status = aDecoder.decodeObject(forKey: QuestPropertyKey.status) as? State else { os_log("couldn't decode quest from CoreData"); return nil}
        guard let title = aDecoder.decodeObject(forKey: QuestPropertyKey.title) as? String else { os_log("couldn't decode quest from CoreData"); return nil}
        guard let desc = aDecoder.decodeObject(forKey: QuestPropertyKey.desc) as? String else { os_log("couldn't decode quest from CoreData"); return nil}
        guard let completedText = aDecoder.decodeObject(forKey: QuestPropertyKey.completedText) as? String else { os_log("couldn't decode quest from CoreData"); return nil}
        guard let points = aDecoder.decodeObject(forKey: QuestPropertyKey.points) as? Points else { os_log("couldn't decode quest from CoreData"); return nil}
        let penalty = aDecoder.decodeObject(forKey: QuestPropertyKey.penalty) as? Points

        self.init(id:id, status:status, title:title, desc:desc, completedText:completedText, points:points, penalty:penalty)

	}

	//NSCoding
	func encode(with aCoder: NSCoder) {
		aCoder.encode(id, forKey: QuestPropertyKey.id)
		aCoder.encode(status, forKey: QuestPropertyKey.status)
		aCoder.encode(title, forKey: QuestPropertyKey.title)
		aCoder.encode(desc, forKey: QuestPropertyKey.desc)
		aCoder.encode(completedText, forKey: QuestPropertyKey.completedText)
		aCoder.encode(points, forKey: QuestPropertyKey.points)
		aCoder.encode(penalty, forKey: QuestPropertyKey.penalty)

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

struct QuestPropertyKey {
	static let status = "status"
	static let id = "id"
	static let title = "title"
	static let desc = "desc"
	static let completedText = "comText"
	static let points = "points"
	static let penalty = "penalty"
}
