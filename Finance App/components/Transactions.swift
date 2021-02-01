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
	
    var creditCard: CreditCard
    @State private var showingTransactionForm = false
    
    var body: some View {
		let items = [
			InvoiceItem(id: 1, title: "McDonalds", description: "Delivery", category: "Online", value: 79.90, when: Date()),
			InvoiceItem(id: 2, title: "Macbook Pro 16 inch", description: "Apple inc", category: "Online", value: 79.90, when: Date()),
			InvoiceItem(id: 3, title: "Pedido 5870", description: "Habib's", category: "Online", value: 79.90, when: Date())
		]
		
        VStack(spacing: 30) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Transações")
                        .font(.system(.title))
                        .bold()
                    Text(creditCard.name)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("list-ul-solid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(width: 24, height: 24)
                    Button(action: {
                        self.showingTransactionForm.toggle()
                    }, label: {
                        Image("plus-solid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(width: 24, height: 24)
                    .sheet(isPresented: $showingTransactionForm, onDismiss: {}, content: {
                        TransactionFormView(creditCard: creditCard)
                    })
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
        Transactions(creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 10000, availableLimit: 10000))
    }
}
