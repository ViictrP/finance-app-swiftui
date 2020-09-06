//
//  ContentView.swift
//  Finance App
//
//  Created by Victor Prado on 26/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct CreditCardView: View, CalendarMonthChanged {
	let uiState: UIStateModel = UIStateModel()
    @State var stack = false
	@State var month: Int = 0
	@State var year: Int = 0
	var creditCards: [CreditCard] = [
		CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 4250, availableLimit: 4250),
		CreditCard(id: 1, name: "Latam", closeDay: 10, number: "9162", limit: 12500, availableLimit: 12500),
		CreditCard(id: 1, name: "Visa Gold", closeDay: 10, number: "9652", limit: 8500, availableLimit: 8500),
        CreditCard(id: 1, name: "Porto Seguro", closeDay: 10, number: "9666", limit: 4000, availableLimit: 4000)
	]
	
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
                        HStack(spacing: 30) {
                            Button(action: { stack.toggle() }, label: {
                                Image(stack ? "stack" : "carousel")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("main"))
                            })
                            .frame(width: 24, height: 24)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("plus-solid")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            })
                            .frame(width: 24, height: 24)
                        }
					}
					.padding(.horizontal)
					
                    if stack {
                        CreditCardStackCarousel(items: CreditCardStackCarousel.toStackItems(creditCards: creditCards))
                    } else {
                        CreditCardCarousel(items: creditCards)
                    }
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
