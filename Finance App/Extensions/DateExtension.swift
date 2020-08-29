//
//  DateExtension.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

extension Date {
	func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
		return calendar.dateComponents(Set(components), from: self)
	}

	func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
		return calendar.component(component, from: self)
	}
}
