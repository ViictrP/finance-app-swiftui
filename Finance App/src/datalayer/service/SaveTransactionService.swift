//
//  TransactionService.swift
//  Finance App
//
//  Created by Victor Prado on 03/12/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

class SaveTransactionService: SaveTransactionUseCase {
    
    private var saveRepository: SaveTransactionRepository
    
    init(saveRepository: SaveTransactionRepository) {
        self.saveRepository = saveRepository
    }
    
    func save(_ transaction: Transaction) {
        let dto = TransactionDTO(title: transaction.title, description: transaction.description, when: transaction.when, value: transaction.value, parcelAmount: transaction.parcelAmount, parcelNumber: transaction.parcelNumber, budgetId: transaction.budgetId)
        self.saveRepository.save(dto)
    }
}
