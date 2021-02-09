//
//  CreditCardFormView.swift
//  Finance App
//
//  Created by Victor Prado on 08/02/21.
//  Copyright © 2021 ViictrP. All rights reserved.
//

import SwiftUI

struct CreditCardFormView: View {
    @Namespace private var ns
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var expireDay: String = ""
    @State private var limit: String = ""
    @State private var flag: String = ""
    @State private var number: String = ""
    
    @State var tapped = false
    
    func save() {
        if !title.isEmpty && !expireDay.isEmpty && !limit.isEmpty && !number.isEmpty {
            let expireDayInt = Int(expireDay) ?? 0
            let limitDouble = Double(limit) ?? 0.0
            let creditCard = CreditCard(id: 1, name: title, closeDay: expireDayInt, number: number, limit: limitDouble, availableLimit: limitDouble)
            print(creditCard)
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Novo cartão de crédito")
                            .font(.largeTitle)
                            .bold()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Cadastre um novo cartão de crédito para começar a lançar seus gastos e pagamentos. \nPreencha todas as informações corretamente.")
                            Text("obs: os campos contendo * são obrigatórios.")
                                .font(.footnote)
                        }
                    }
                    
                    VStack(spacing: 20) {
                        Input(placeholder: "título", icon: Image("text"), type: "text", text: $title, required: true)

                        Input(placeholder: "descrição", icon: Image("text"), type: "text", text: $description, required: true)

                        Input(placeholder: "número", icon: Image("money-wave"), type: "number", text: $number, required: true)
                        
                        Input(placeholder: "dia de vencimento", icon: Image("money-wave"), type: "number", text: $expireDay, required: true)
                        
                        Input(placeholder: "limite", icon: Image("money-wave"), type: "currency", text: $limit, required: true)
                        
                        Input(placeholder: "bandeira", icon: Image("text"), type: "text", text: $flag, required: true)
                        
                        Spacer()
                        
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

struct CreditCardFormView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardFormView()
    }
}
