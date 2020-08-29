//
//  Calendar.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

protocol CalendarMonthChanged {
	func onNextMonth(month: Int, year: Int)
	func onPreviousMonth(month: Int, year: Int)
}

struct CalendarView: View {
	let HORIZONTAL_PADDING: CGFloat = 30
	let BUTTON_WIDTH: CGFloat = 24
	let BUTTON_HEIGHT: CGFloat = 24
	var delegate: CalendarMonthChanged?
	
	@State() var month: CalendarMonth = CalendarMonths.getMonth(monthIndex: Date().get(.month))
	@State var year: Int = Date().get(.year)
	
    var body: some View {
		HStack {
			Button(action: {
				self.month = CalendarMonths.getPrevious(monthIndex: self.month.arrayIndex)
				self.delegate?.onPreviousMonth(month: self.month.calendarIndex, year: year)
			}, label: {
				Image("back")
					.resizable()
					.aspectRatio(contentMode: .fit)
			})
			.frame(width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
			.padding(10)
			.background(Color.blue)
			.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0.0, y: 0.0)
			
			Spacer()
			
			VStack(spacing: 10) {
				Text("\(self.year)".replacingOccurrences(of: ",", with: ""))
					.font(.system(.headline))
					.foregroundColor(Color("Subheadline"))
				
				Text("\(self.month.name)")
					.font(.system(size: 23))
			}
			
			Spacer()
			
			Button(action: {
				self.month = CalendarMonths.getNext(monthIndex: self.month.arrayIndex)
				self.delegate?.onNextMonth(month: self.month.calendarIndex, year: self.year)
			}, label: {
				Image("next")
					.resizable()
					.aspectRatio(contentMode: .fit)
			})
			.frame(width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
			.padding(10)
			.background(Color.blue)
			.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0.0, y: 0.0)
		}
		.padding(.horizontal, HORIZONTAL_PADDING)
    }
}

struct Calendar_Previews: PreviewProvider {
	static var previews: some View {
        CalendarView()
    }
}
