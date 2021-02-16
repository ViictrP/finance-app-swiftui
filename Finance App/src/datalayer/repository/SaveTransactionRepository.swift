//
//  SaveTransactionRepository.swift
//  Finance App
//
//  Created by Victor Prado on 16/02/21.
//  Copyright © 2021 ViictrP. All rights reserved.
//

import Foundation

protocol SaveTransactionRepository {
    func save(_ transaction: TransactionDTO)
}
