//
//  UICarrouselStateModel.swift
//  Finance App
//
//  Created by Victor Prado on 01/02/21.
//  Copyright © 2021 ViictrP. All rights reserved.
//

import Foundation

public class UICarrouselStateModel: ObservableObject {
    @Published var activeCard: Int      = 0
    @Published var screenDrag: Float    = 0.0
}
