//
//  Input.swift
//  Finance App
//
//  Created by Victor Prado on 15/09/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct Input: View {
    var placeholder: String
    var icon: Image?
    var type: String
    
    @Binding var text: String
    @State private var value: Double? = 0.0
    @State var required: Bool
    @State private var dirty: Bool = false
    @State private var valid = false
    
    var body: some View {
        let binding = Binding<Double?>(
            get: {
                print(self.text)
                return Double(self.text)
            },
            set: {
                self.text = String($0!)
            }
        )
        
        
        VStack(alignment: .leading) {
            ZStack(alignment: .trailing) {
                HStack {
                    if icon != nil {
                        icon!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .opacity(0.2)
                            
                    }

                    if type == "currency" {
                        CurrencyTextField("\(placeholder) \(required ? "*" : "")", value: binding, onEditingChanged:  { (isEditing) in
                            
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
                        })
                        .font(.title)
                        .keyboardType(
                            type == "number" || type == "currency" ? .numberPad :
                                type == "text" ? .default :
                                type == "date" ? .numbersAndPunctuation : .default
                        )
                    } else if type == "number" {
                        NumberTextField("\(placeholder) \(required ? "*" : "")", value: binding, onEditingChanged:  { (isEditing) in
                            
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
                        })
                        .font(.title)
                        .keyboardType(
                            type == "number" || type == "currency" ? .numberPad :
                                type == "text" ? .default :
                                type == "date" ? .numbersAndPunctuation : .default
                        )
                    } else {
                        TextField("\(placeholder) \(required ? "*" : "")", text: $text) { (isEditing) in
                            
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
                        .font(.title)
                        .keyboardType(
                            type == "number" || type == "currency" ? .numberPad :
                                type == "text" ? .default :
                                type == "date" ? .numbersAndPunctuation : .default
                        )
                    }
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
