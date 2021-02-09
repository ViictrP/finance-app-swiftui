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

struct CustomCalendar: View {
	let BUTTON_WIDTH: CGFloat = 24
	let BUTTON_HEIGHT: CGFloat = 40
	var delegate: CalendarMonthChanged?
	
	@State() var month: CalendarMonth = CalendarMonths.getMonth(monthIndex: Date().get(.month))
	@State var year: Int = Date().get(.year)
	
	var body: some View {
		VStack {
			HStack {
				VStack {
					Button(action: {
						self.month = CalendarMonths.getPrevious(monthIndex: self.month.arrayIndex)
						if self.month.arrayIndex == CalendarMonths.DECEMBER.arrayIndex {
							self.year -= 1
						}
                        self.delegate?.onPreviousMonth(month: self.month.calendarIndex, year: self.year)
					}, label: {
						Image("back")
							.resizable()
							.aspectRatio(contentMode: .fit)
					})
					.buttonStyle(PlainButtonStyle())
					.frame(width: 18, height: 18)
				}
				.frame(width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
				.padding(10)
				.background(Color("main"))

				Spacer()
				
				VStack(spacing: 3) {
					Text("\(self.year)".replacingOccurrences(of: ",", with: ""))
						.font(.system(.subheadline))
						.foregroundColor(Color("Subheadline"))
					
					Text("\(self.month.name)")
						.font(.headline)
				}
				
				Spacer()
				
				VStack {
					Button(action: {
						self.month = CalendarMonths.getNext(monthIndex: self.month.arrayIndex)
						if self.month.arrayIndex == CalendarMonths.JANUARY.arrayIndex {
							self.year += 1
						}
						self.delegate?.onNextMonth(month: self.month.calendarIndex, year: self.year)
					}, label: {
						Image("next")
							.resizable()
							.aspectRatio(contentMode: .fit)
					})
					.buttonStyle(PlainButtonStyle())
					.frame(width: 18, height: 18)
				}
				.frame(width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
				.padding(10)
				.background(Color("main"))
			}
			.background(Color.gray.opacity(0.1))
			.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			
		}
		.padding(.horizontal)
	}
}

struct Calendar_Previews: PreviewProvider {
	static var previews: some View {
		CustomCalendar()
	}
}
