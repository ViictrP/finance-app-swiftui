//
//  ContentView.swift
//  SnapCarousel
//
//  Created by ericg on 5/17/20.
//  Copyright © 2020 ericg. All rights reserved.
//

import SwiftUI

struct CreditCardCarousel: View, CarouselDelegate {
    let delegate: CreditCardCarouselDelegate?
	private var state: UICarrouselStateModel
	var items: [CreditCard]
	
    init(items: [CreditCard], state: UICarrouselStateModel, delegate: CreditCardCarouselDelegate?) {
		self.items = items
        self.state = state
        self.delegate = delegate
	}
    
    func onChange(index: Int) {
        if let delegate = self.delegate {
            if index >= 0 && index < items.count {
                delegate.onChange(creditCard: items[index])
            }
        }
    }
	
	var body: some View {
		let spacing:            CGFloat = 10
		let widthOfHiddenCards: CGFloat = 5
		
        return Carousel(numberOfItems: CGFloat( items.count ), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards, delegate: self) {
			ForEach(items.indices, id: \.self) { index in
                CreditCardItem(creditCard: self.items[index])
			}
		}
		.frame(width: UIScreen.main.bounds.width)
		.environmentObject( self.state )
	}
}

struct SnapCarousel_Previews: PreviewProvider {
	static var previews: some View {
        CreditCardCarousel(items: [CreditCard(id: 1, name: "Latam", closeDay: 10, number: "9162", limit: 8500, availableLimit: 8500)], state: UICarrouselStateModel(), delegate: nil)
	}
}


struct CreditCardItem: View {
	var creditCard: CreditCard
	
	init(creditCard: CreditCard) {
		self.creditCard = creditCard
	}
	
	var body: some View {
		let spacing:            CGFloat = 10
		let widthOfHiddenCards: CGFloat = 5
		let cardHeight:         CGFloat = 100
		
		return Item( _id:                  Int(self.creditCard.id),
			  spacing:              spacing,
			  widthOfHiddenCards:   widthOfHiddenCards,
			  cardHeight:           cardHeight ) {
			HStack {
				Image("nubank")
					.resizable()
					.frame(width:36, height: 24, alignment: .leading)
				Spacer()
				VStack(alignment: .leading, spacing: 10) {
					Text("\(self.creditCard.name)")
					Text("XXXX XXXX XXXX \(self.creditCard.number)")
						.font(.system(.headline))
						.foregroundColor(Color("Fadded-text"))
				}
				Spacer()
				Button(action: {}, label: {
					Image("next")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding()
				}).frame(width: 50, height: cardHeight)
				.background(Color.white.opacity(0.1))
			}
			.padding(.leading)
		}
		.foregroundColor(Color.white)
		.background(Color("main"))
		.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
		.shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 10)
		.transition(AnyTransition.slide)
		.animation(.spring())
	}
}
