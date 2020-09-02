//
//  TransactionFormView.swift
//  Finance App
//
//  Created by Victor Prado on 01/09/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct TransactionFormView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var when: Date = Date()
    @State private var value: Double = 0.0
    @State private var category: Int?
    
    var body: some View {
        Form {
            HStack {
                VStack {
                    Image("arrow_down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 18, height: 18)
                TextField("título", text: $title)
                    .keyboardType(.default)
            }
            
            HStack {
                VStack {
                    Image("arrow_down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 18, height: 18)
                TextField("descrição", text: $description)
                    .keyboardType(.default)
            }
            
            HStack {
                VStack {
                    Image("arrow_down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 18, height: 18)
                Picker(selection: $category, label: Text("Categoria").foregroundColor(Color("Subheadline"))) /*@START_MENU_TOKEN@*/{
                    Text("Online").tag(1)
                    Text("Delivery").tag(2)
                }
            }/*@END_MENU_TOKEN@*/
            
            HStack {
                VStack {
                    Image("arrow_down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 18, height: 18)
                DatePicker(selection: $when, label: {
                            Text("quando")
                                .foregroundColor(Color("Subheadline"))

                })
            }
            
            HStack {
                VStack {
                    Image("arrow_down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 18, height: 18)
                Stepper(value: $value) {
                    Text("valor")
                        .foregroundColor(Color("Subheadline"))
                }
            }
        }
    }
}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}
