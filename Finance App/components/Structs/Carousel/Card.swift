//
//  Card.swift
//  Finance App
//
//  Created by Victor Prado on 27/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation

struct Card: Decodable, Hashable, Identifiable {
	var id:     Int
	var name:   String = ""
}
