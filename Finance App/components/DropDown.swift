//
//  DropDown.swift
//  Finance App
//
//  Created by Victor Prado on 03/09/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct DropDown : View {
    var title: String
    var items: [DropDownItem]
    
    @State private var expand = false
    @State var selected: Int = 0
    @State private var innerSelection: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1, content: {
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
                        VStack {
                            Image("times-circle-solid")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                        }
                        .frame(width: 18, height: 18)
                        
                    })
                } else {
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
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
                        Spacer()
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                }
            }
        })
        .background(LinearGradient(gradient: .init(colors: [Color("main"), Color("main")]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(expand ? 0.3 : 0), radius: 10, x: 0.0, y: 5)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.5))
        // .animation(.easeInOut(duration: 0.2))
        .onTapGesture {
            self.expand.toggle()
        }
    }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown(title: "selecione", items: [DropDownItem(id: 1, title: "OPTION")])
    }
}
