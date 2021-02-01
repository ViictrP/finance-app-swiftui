//
//  Invoice.swift
//  Finance App
//
//  Created by Victor Prado on 01/09/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

struct Invoice {
    
    var id: Int?
    var title: String
    var description: String
    var paid: Bool
    var creditCardId: Int?
    var month: Int
    var year: Int
    var transactions: [Transaction]
}
