//
//  CreditCard.swift
//  Finance App
//
//  Created by Victor Prado on 30/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

struct CreditCard: Identifiable {
	
	var id: Int
	var name: String
	var closeDay: Int
	var number: String
	var limit: Double
	var availableLimit: Double
}
