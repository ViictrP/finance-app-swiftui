//
//  SaveTransaction.swift
//  Finance App
//
//  Created by Victor Prado on 03/12/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

protocol SaveTransactionUseCase {
    func save(_ transaction: Transaction)
}
