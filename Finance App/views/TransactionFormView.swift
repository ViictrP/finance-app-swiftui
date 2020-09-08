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
    @State var value: Double = 0.0
    @State var category: Int = 0
    
    @State var tapped = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                Title()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 15) {
                        InputText(placeholder: "título...", icon: Image("text"), text: $title, required: true)

                        InputText(placeholder: "descrição...", icon: Image("text"), text: $description, required: true)

                        InputText(placeholder: "valor...", icon: Image("money-wave"), text: $title, required: true)

                        InputText(placeholder: "quando...", icon: Image("calendar"), text: $title, required: true)
                    }

                    DropDown(title: "categoria", items: [
                        DropDownItem(id: 1, title: "DELIVERY", icon: Image("motorcycle-solid")),
                        DropDownItem(id: 2, title: "ONLINE", icon: Image("globe-americas-solid")),
                        DropDownItem(id: 3, title: "MAQUININHA", icon: Image("mobile-alt-solid"))
                    ], required: true, selected: self.category)
                    
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
                    .offset(x: 0, y: 300)
                }
            }
            .padding()
        }
    }
}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}

struct InputText: View {
    var placeholder: String
    var icon: Image?
    @Binding var text: String
    @State var required: Bool
    @State private var dirty: Bool = false
    @State private var valid = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                HStack {
                    if icon != nil {
                        icon!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .opacity(0.2)
                            
                    }
                    TextField("\(placeholder)", text: $text) { isEditing in
                        if isEditing {
                            valid = true
                        }
                        
                        if !isEditing && !text.isEmpty {
                            valid = true
                        }
                        if !isEditing && text.isEmpty {
                            valid = false
                            dirty = true
                        }
                    }
                    .font(.system(size: 22))
                }
                    
                
                if dirty && !valid {
                    Text("este campo é obrigatório")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .animation(.spring())
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .foregroundColor(dirty && !valid ? Color.red : Color("Fadded-text"))
        )
        .animation(.spring())
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
