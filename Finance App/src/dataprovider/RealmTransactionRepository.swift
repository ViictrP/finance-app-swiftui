//
//  RealmTransactionRepository.swift
//  Finance App
//
//  Created by Victor Prado on 01/02/21.
//  Copyright © 2021 ViictrP. All rights reserved.
//

import Foundation

class RealmTransactionRepository: SaveTransactionUseCase {
    
    func save(transaction: Transaction) {
        print(transaction)
    }
}
