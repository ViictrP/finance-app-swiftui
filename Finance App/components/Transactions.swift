//
//  Transactions.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct InvoiceItem {
	var id: Int
	var title: String
	var description: String
	var category: String
	var value: Double
	var when: Date
}

struct Transactions: View {
	
    var body: some View {
		let items = [
			InvoiceItem(id: 1, title: "McDonalds", description: "Delivery", category: "Online", value: 79.90, when: Date()),
			InvoiceItem(id: 2, title: "Macbook Pro 16 inch", description: "Apple inc", category: "Online", value: 79.90, when: Date()),
			InvoiceItem(id: 3, title: "Pedido 5870", description: "Habib's", category: "Online", value: 79.90, when: Date())
		]
		
		
		VStack(spacing: 30) {
			HStack {
				Text("Transações")
					.font(.system(.title))
					.bold()
				Spacer()
				HStack(spacing: 20) {
					Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
						Image("list-ul-solid")
							.resizable()
							.aspectRatio(contentMode: .fit)
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
			VStack(alignment: .leading, spacing: 20) {
				ForEach(items, id: \.self.id) { item in
					TransactionItem(transaction: item)
				}
			}
		}
		.padding(.horizontal)
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
