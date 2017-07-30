//
//  Points.swift
//  Meeka
//
//  Created by Jakob Wedemeyer on 30/07/17.
//  Copyright © 2017 Mindful Meerkats. All rights reserved.
//

import Foundation
import CoreData

class Points: NSObject, NSCoding {

	//Properties of a Points object
	var pawprint: Int
	var fitness: Int
	var body: Int
	var mind: Int
	var community: Int
	var thriftiness: Int
	var soul: Int

	//init section
	init(pawprint: Int, fitness: Int, body: Int, mind: Int, community: Int, thriftiness: Int, soul: Int) {
		self.pawprint = pawprint
		self.fitness = fitness
		self.body = body
		self.mind = mind
		self.community = community
		self.thriftiness = thriftiness
		self.soul = soul
	}

	required convenience init?(coder aDecoder: NSCoder) {

	}

	func encode(with aCoder: NSCoder) {

	}

	func updatePlayerPoints(updates: Points) {
		self.body = updates.body
		self.fitness = updates.fitness
		self.pawprint = updates.pawprint
		self.mind = updates.mind
		self.community = updates.community
		self.thriftiness = updates.thriftiness
		self.soul = updates.soul
	}

	struct Properties {
		<#fields#>
	}
}
