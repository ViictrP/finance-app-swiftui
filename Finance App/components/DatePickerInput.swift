//
//  DatePickerInput.swift
//  Finance App
//
//  Created by Victor Prado on 03/12/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation
import SwiftUI

struct DatePickerInput: View {
    var placeholder: String
    var icon: Image?
    var type: String
    
    @Binding var date: Date
    @State var required: Bool
    @State private var dirty: Bool = false
    @State private var valid = false
    
    var body: some View {
        
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

                    DatePicker("\(placeholder) \(required ? "*" : "")", selection: $date, displayedComponents: .date)
                    .font(.title)
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
