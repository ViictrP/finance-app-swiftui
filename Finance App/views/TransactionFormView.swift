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
                    Title()
                    
                    VStack(spacing: 20) {
                        Input(placeholder: "título", icon: Image("text"), type: "text", text: $title, required: true)

                        Input(placeholder: "descrição", icon: Image("text"), type: "text", text: $description, required: true)

                        Input(placeholder: "valor", icon: Image("money-wave"), type: "currency", text: $value, required: true)
                        
                        Input(placeholder: "qtde parcelas", icon: Image("copy-solid"), type: "number", text: $parcelAmount, required: true)
                        
                        DatePickerInput(placeholder: "quando", icon: Image("calendar"), type: "date", date: $when, required: true)

                        DropDown(title: "categoria", items: [
                            DropDownItem(id: 1, title: "DELIVERY", icon: Image("motorcycle-solid")),
                            DropDownItem(id: 2, title: "ONLINE", icon: Image("globe-americas-solid")),
                            DropDownItem(id: 3, title: "MAQUININHA", icon: Image("mobile-alt-solid"))
                        ], required: true, selected: self.category)
                        .zIndex(1)
                        
                        Button(action: { self.save() }, label: {
                            Text("salvar")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        })
                        .frame(width: 300)
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
        TransactionFormView()
    }
}

struct Title: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Nova transação")
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Cadastre uma nova transação para o cartão Nubank. Preencha todas as informações corretamente.")
                Text("obs: os campos contendo * são obrigatórios.")
                    .font(.footnote)
            }
        }
    }
}
