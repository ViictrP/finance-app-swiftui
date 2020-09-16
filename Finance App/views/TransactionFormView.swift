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
                        
                        CustomDatePicker(binding: $when, placeholder: "quando", required: true)

                        DropDown(title: "categoria", items: [
                            DropDownItem(id: 1, title: "DELIVERY", icon: Image("motorcycle-solid")),
                            DropDownItem(id: 2, title: "ONLINE", icon: Image("globe-americas-solid")),
                            DropDownItem(id: 3, title: "MAQUININHA", icon: Image("mobile-alt-solid"))
                        ], required: true, selected: self.category)
                        .zIndex(1)
                        
                        Button(action: {}, label: {
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

struct CustomDatePicker: View {
    @Binding var binding: Date
    var placeholder: String = "DatePicker"
    var required = false
    var size: CGSize = CGSize(width: UIScreen.main.bounds.width - 30, height: 65)
    
    @State private var dirty = false
    @State private var valid = false
    @State private var openned = false
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack {
            HStack {
                Button(action: {
                    openned.toggle()
                    dirty = true
                }, label: {
                    HStack {
                        Image("calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .opacity(0.2)
                        
                        Text("\(placeholder) \(required ? "*" : "")")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Spacer(minLength: 0)
                })
                .padding()
            }
            .frame(width: size.width, height: 65)
            .background(Color("main"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .foregroundColor(dirty && !valid ? Color.red : Color("Fadded-text"))
            )
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("DatePicker")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button(action: { openned.toggle() }, label: {
                        Text("close")
                            .font(.headline)
                            .foregroundColor(.white)
                    })
                }
                Spacer(minLength: 0)
            }
            .padding()
            .frame(width: size.width + 30, height: screenHeight / 2)
            .background(Color("main"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: -10)
            .zIndex(2)
            .offset(x: 0, y: openned ? 50 : screenHeight)
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.5))
        }
        .zIndex(3)
        .frame(width: size.width, height: size.height)
    }
}
