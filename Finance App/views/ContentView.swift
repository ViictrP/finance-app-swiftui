//
//  ContentView.swift
//  Finance App
//
//  Created by Victor Prado on 26/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct ContentView: View, CalendarMonthChanged {
	let HORIZONTAL_PADDING: CGFloat = 30
	let uiState: UIStateModel = UIStateModel()
	@State var month: Int = 0
	@State var year: Int = 0
	
	func onNextMonth(month: Int, year: Int) {
		self.month = month
		self.year = year
	}
	
	func onPreviousMonth(month: Int, year: Int) {
		self.month = month
		self.year = year
	}
	
    var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .center, spacing: 30) {
				HStack {
					Text("Seus cartões")
						.font(.system(.title))
						.bold()
					Spacer()
					Button("add novo") { }
				}
				.padding(.horizontal, HORIZONTAL_PADDING)
				
				SnapCarousel(UIState: uiState)
				
				Spacer()
				
				CalendarView(delegate: self)
				
				ProgressBar()
				
				Spacer()
				
				Transactions()
			}
			.padding(.top, 30)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
