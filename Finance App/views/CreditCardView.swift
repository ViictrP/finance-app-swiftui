//
//  ContentView.swift
//  Finance App
//
//  Created by Victor Prado on 26/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct CreditCardView: View, CalendarMonthChanged {
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
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .center, spacing: 50) {
				VStack(spacing: 30) {
					HStack {
						Text("Seus cartões")
							.font(.system(.title))
							.bold()
						Spacer()
						Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
							Image("plus-solid")
								.resizable()
								.aspectRatio(contentMode: .fit)
						})
						.frame(width: 24, height: 24)
					}
					.padding(.horizontal, HORIZONTAL_PADDING)
					
					SnapCarousel(UIState: uiState)
				}
				
				CalendarView(delegate: self)
				
				ProgressBar()
				
				Transactions()
			}
			.padding(.top, 30)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
    }
}
