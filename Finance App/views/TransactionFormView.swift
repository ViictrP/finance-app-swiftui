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
        ZStack {
            VStack {
                TextField("Título", text: $title)
                
                TextField("Título", text: $title)
                
                TextField("Título", text: $title)
                
                TextField("Título", text: $title)
            }
            
            DropDown(title: "categoria", items: [
                DropDownItem(id: 1, title: "DELIVERY", icon: Image("motorcycle-solid")),
                DropDownItem(id: 2, title: "ONLINE", icon: Image("globe-americas-solid")),
                DropDownItem(id: 3, title: "MAQUININHA", icon: Image("mobile-alt-solid"))
            ], selected: self.category)
        }
        .padding()
    }
}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}
