//
//  TransactionItem.swift
//  Finance App
//
//  Created by Victor Prado on 29/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct TransactionItem: View {
	let HORIZONTAL_PADDING: CGFloat = 30
	var transaction: InvoiceItem
	
    var body: some View {
		HStack(spacing: 20) {
			VStack(alignment: .center) {
				Image("shopping-bag-solid")
					.resizable()
					.aspectRatio(contentMode: .fit)
			}
			.frame(width: 25, height: 50)
			.padding()
			.background(Color("main"))
			.clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
		
			VStack(alignment: .leading, spacing: 10) {
				HStack {
					Text(transaction.category)
						.font(.subheadline)
						.foregroundColor(Color("Subheadline"))
					Spacer()
					Text("\(transaction.when.get(.day))/\(transaction.when.get(.month))/\(transaction.when.get(.year))".replacingOccurrences(of: ",", with: ""))
						.font(.subheadline)
						.foregroundColor(Color("Subheadline"))
				}
				
				Text(transaction.title)
					.font(.system(size: 20))

				Text(transaction.description)
					.font(.body)
			}
			.padding(.trailing)
		}
		.padding(.leading, 10)
		.padding(.vertical, 10)
		.background(Color.gray.opacity(0.1))
		.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct TransactionItem_Previews: PreviewProvider {
    static var previews: some View {
		TransactionItem(transaction: InvoiceItem(id: 1, title: "Teste", description: "Teste", category: "Online", value: 199.99, when: Date()))
    }
}
