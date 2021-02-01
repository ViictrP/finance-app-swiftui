//
//  TransactionFormView.swift
//  Finance App
//
//  Created by Victor Prado on 01/09/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct TransactionFormView: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var when: Date = Date()
    @State var value: String = ""
    @State var parcelAmount: String = "1"
    @State var category: Int = 0
    
    @State var tapped = false
    @State private var openned = true
    
    var creditCard: CreditCard
    
    func save() {
        if !title.isEmpty && !description.isEmpty && !value.isEmpty {
            let transaction = Transaction(id: 1, title: title, description: description, when: when, value: Double(value)!, icon: "teste", parcelAmount: 1, categoryId: category, parcelId: nil, invoiceId: nil, parcelNumber: 1, budgetId: 1)
            print(transaction)
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Nova transação")
                            .font(.largeTitle)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Group {
                                Text("Cadastre uma nova transação para o cartão ") +
                                Text("\(self.creditCard.name). ")
                                    .font(.system(size: 18))
                                    .bold() +
                                Text("Preencha todas as informações corretamente.")
                            }
                            Text("obs: os campos contendo * são obrigatórios.")
                                .font(.footnote)
                        }
                    }
                    
                    VStack(spacing: 20) {
                        DropDown(title: "categoria", items: [
                            DropDownItem(id: 1, title: "DELIVERY", icon: Image("motorcycle-solid")),
                            DropDownItem(id: 2, title: "ONLINE", icon: Image("globe-americas-solid")),
                            DropDownItem(id: 3, title: "MAQUININHA", icon: Image("mobile-alt-solid"))
                        ], required: true, selected: self.category)
                        .zIndex(1)
                        
                        Input(placeholder: "título", icon: Image("text"), type: "text", text: $title, required: true)

                        Input(placeholder: "descrição", icon: Image("text"), type: "text", text: $description, required: true)

                        Input(placeholder: "valor", icon: Image("money-wave"), type: "currency", text: $value, required: true)
                        
                        Input(placeholder: "qtde parcelas", icon: Image("copy-solid"), type: "number", text: $parcelAmount, required: true)
                        
                        DatePickerInput(placeholder: "quando", icon: Image("calendar"), type: "date", date: $when, required: true)

                        
                        
                        Button(action: { self.save() }, label: {
                            Spacer()
                            Text("salvar")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            Spacer()
                        })
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color("main"))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .animation(.easeInOut(duration: 0.3))
                        
                    }
                }
                .padding()
            }
        }
    }
}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView(creditCard: CreditCard(id: 1, name: "Nubank", closeDay: 10, number: "5966", limit: 10000, availableLimit: 10000))
    }
}
