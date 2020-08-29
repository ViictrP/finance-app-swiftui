//
//  CalendarMonths.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

struct CalendarMonth {
	var name: String
	var calendarIndex: Int
	var arrayIndex: Int
	var previous: Int
	var next: Int
	
	init(name: String, calendarIndex: Int, arrayIndex: Int, previous: Int, next: Int) {
		self.name = name
		self.calendarIndex = calendarIndex
		self.arrayIndex = arrayIndex
		self.previous = previous
		self.next = next
	}
}

struct CalendarMonths {
	static let JANUARY = CalendarMonth(name: "JANEIRO", calendarIndex: 1, arrayIndex: 0, previous: 12, next: 2)
	static let FEBRUARY = CalendarMonth(name: "FEVEREIRO", calendarIndex: 2, arrayIndex: 1, previous: 1, next: 2)
	static let MARCH = CalendarMonth(name: "MARÇO", calendarIndex: 3, arrayIndex: 2, previous: 2, next: 2)
	static let APRIL = CalendarMonth(name: "ABRIL", calendarIndex: 4, arrayIndex: 3, previous: 3, next: 2)
	static let MAY = CalendarMonth(name: "MAIO", calendarIndex: 5, arrayIndex: 4, previous: 4, next: 2)
	static let JUNE = CalendarMonth(name: "JUNHO", calendarIndex: 6, arrayIndex: 5, previous: 5, next: 2)
	static let JULY = CalendarMonth(name: "JULHO", calendarIndex: 7, arrayIndex: 6, previous: 6, next: 2)
	static let AUGUST = CalendarMonth(name: "AGOSTO", calendarIndex: 8, arrayIndex: 7, previous: 7, next: 2)
	static let SEPTEMBER = CalendarMonth(name: "SETEMBRO", calendarIndex: 9, arrayIndex: 8, previous: 8, next: 2)
	static let OCTOBER = CalendarMonth(name: "OUTUBRO", calendarIndex: 10, arrayIndex: 9, previous: 9, next: 2)
	static let NOVEMBER = CalendarMonth(name: "NOVEMBRO", calendarIndex: 11, arrayIndex: 10, previous: 10, next: 2)
	static let DECEMBER = CalendarMonth(name: "DEZEMBRO", calendarIndex: 12, arrayIndex: 11, previous: 11, next: 2)
	
	static var MONTHS: [CalendarMonth] = [
		JANUARY,
		FEBRUARY,
		MARCH,
		APRIL,
		MAY,
		JUNE,
		JULY,
		AUGUST,
		SEPTEMBER,
		OCTOBER,
		NOVEMBER,
		DECEMBER
	]
	
	static func getMonth(monthIndex: Int) -> CalendarMonth {
		let filtered = CalendarMonths.MONTHS.filter { month in
			return month.calendarIndex == monthIndex
		}[0].arrayIndex
		return CalendarMonths.MONTHS[filtered]
	}
	
	static func getNext(monthIndex: Int) -> CalendarMonth {
		return CalendarMonths.MONTHS[CalendarMonths.MONTHS[monthIndex].next]
	}
	
	static func getPrevious(monthIndex: Int) -> CalendarMonth {
		return CalendarMonths.MONTHS[CalendarMonths.MONTHS[monthIndex].previous]
	}
}
