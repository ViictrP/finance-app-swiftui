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
        VStack {
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

struct DropDownItem : Identifiable {
    var id: Int
    var title: String
    var icon: Image?
}

struct DropDown : View {
    var title: String
    var items: [DropDownItem]
    
    @State private var expand = false
    @State var selected: Int = 0
    @State private var innerSelection: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(innerSelection)
                    .foregroundColor(Color.white.opacity(0.8))
                
                
                if innerSelection != "" {
                    Button(action: {
                        self.innerSelection = ""
                    }, label: {
                        Image(systemName: expand ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6)
                            .foregroundColor(.white)
                    })
                } else {
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(.white)
                }
            }
            
            
            if expand {
                ForEach(items) { item in
                    HStack(spacing: 20) {
                        if item.icon != nil {
                            VStack {
                                item.icon!
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 20, height: 20)
                        }
                        Button(action: {
                            self.selected = item.id
                            self.innerSelection = item.title
                            self.expand.toggle()
                        }, label: {
                            Text(item.title)
                        })
                        .foregroundColor(.white)
                    }
                }
            }
        })
        .padding()
        .background(LinearGradient(gradient: .init(colors: [.blue, .blue]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(expand ? 0.3 : 0), radius: 10, x: 0.0, y: 5)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.5))
        .onTapGesture {
            self.expand.toggle()
        }
    }
}
