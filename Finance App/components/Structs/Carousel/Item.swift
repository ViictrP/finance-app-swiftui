//
//  Item.swift
//  Finance App
//
//  Created by Victor Prado on 27/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation
import SwiftUI

struct Item<Content: View>: View {
	@EnvironmentObject var UIState: UIStateModel
	let cardWidth: CGFloat
	let cardHeight: CGFloat
	
	var _id: Int
	var content: Content
	
	@inlinable public init(
		_id: Int,
		spacing: CGFloat,
		widthOfHiddenCards: CGFloat,
		cardHeight: CGFloat,
		@ViewBuilder _ content: () -> Content
	) {
		self.content = content()
		self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
		self.cardHeight = cardHeight
		self._id = _id
	}
	
	var body: some View {
		content
			.frame(width: cardWidth,
				   height: cardHeight,
				   alignment: .center)
	}
}
