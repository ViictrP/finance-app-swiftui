//
//  Carousel.swift
//  Finance App
//
//  Created by Victor Prado on 27/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation
import SwiftUI

protocol CarouselDelegate {
    func onChange(index: Int)
}

struct Carousel<Items : View> : View {
	let items: Items
	let numberOfItems: CGFloat //= 8
	let spacing: CGFloat //= 16
	let widthOfHiddenCards: CGFloat //= 32
	let totalSpacing: CGFloat
	let cardWidth: CGFloat
    let delegate: CarouselDelegate
	
	@GestureState var isDetectingLongPress = false
	
	@EnvironmentObject var UIState: UICarrouselStateModel
		
	@inlinable public init(
		numberOfItems: CGFloat,
		spacing: CGFloat,
		widthOfHiddenCards: CGFloat,
        delegate: CarouselDelegate,
		@ViewBuilder _ items: () -> Items) {
		
		self.items = items()
		self.numberOfItems = numberOfItems
		self.spacing = spacing
		self.widthOfHiddenCards = widthOfHiddenCards
		self.totalSpacing = (numberOfItems - 1) * spacing
		self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        self.delegate = delegate
	}
	
	var body: some View {
		
		let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
		let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
		let leftPadding = widthOfHiddenCards + spacing
		let totalMovement = cardWidth + spacing

		let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
		let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)

		var calcOffset = Float(activeOffset)

		if (calcOffset != Float(nextOffset)) {
			calcOffset = Float(activeOffset) + UIState.screenDrag
		}
		
		return HStack(alignment: .center, spacing: spacing) {
			items
		}
		.offset(x: CGFloat(calcOffset), y: 0)
		.gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
			self.UIState.screenDrag = Float(currentState.translation.width)

		}.onEnded { value in
			self.UIState.screenDrag = 0

			if (value.translation.width < -50) {
				self.UIState.activeCard = self.UIState.activeCard + 1
				let impactMed = UIImpactFeedbackGenerator(style: .medium)
				impactMed.impactOccurred()
			}

			if (value.translation.width > 50) {
				self.UIState.activeCard = self.UIState.activeCard - 1
				let impactMed = UIImpactFeedbackGenerator(style: .medium)
				impactMed.impactOccurred()
			}
            
            delegate.onChange(index: self.UIState.activeCard)
		})
	}
}
