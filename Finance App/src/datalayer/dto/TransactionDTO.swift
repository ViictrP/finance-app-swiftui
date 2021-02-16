//
//  TransactionDTO.swift
//  Finance App
//
//  Created by Victor Prado on 16/02/21.
//  Copyright © 2021 ViictrP. All rights reserved.
//

import Foundation

struct TransactionDTO {
    var id: Int?
    var title: String
    var description: String
    var when: Date
    var value: Double
    var icon: String?
    var parcelAmount: Int
    var categoryId: Int?
    var parcelId: Int?
    var invoiceId: Int?
    var parcelNumber: Int
    var budgetId: Int
    
}
