//
//  Transactions.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct Transactions: View {
	let HORIZONTAL_PADDING: CGFloat = 30
	
    var body: some View {
		VStack {
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
		}
		.padding(.horizontal, HORIZONTAL_PADDING)
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
