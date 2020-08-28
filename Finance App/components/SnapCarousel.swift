//
//  ContentView.swift
//  SnapCarousel
//
//  Created by ericg on 5/17/20.
//  Copyright © 2020 ericg. All rights reserved.
//

import SwiftUI

struct SnapCarousel: View {
	var UIState: UIStateModel
	
	var body: some View {
		let spacing:            CGFloat = 16
		let widthOfHiddenCards: CGFloat = 10
		// UIScreen.main.bounds.width - 10
		let cardHeight:         CGFloat = 190
		
		let items = [
			Card( id: 0, name: "Hey" ),
			Card( id: 1, name: "Ho" ),
			Card( id: 2, name: "Lets" ),
			Card( id: 3, name: "Go" )
		]
		
		return Carousel(numberOfItems: CGFloat( items.count ), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards) {
			ForEach( items, id: \.self.id ) { item in
				Item( _id:                  Int(item.id),
					  spacing:              spacing,
					  widthOfHiddenCards:   widthOfHiddenCards,
					  cardHeight:           cardHeight ) {
					Text("\(item.name)")
				}
				.foregroundColor(Color.white)
				.background(Color.blue)
				.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
				.shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 10)
				.transition(AnyTransition.slide)
				.animation(.spring())
			}
		}
		.frame(width: UIScreen.main.bounds.width)
		.environmentObject( self.UIState )
	}
}

public class UIStateModel: ObservableObject {
	@Published var activeCard: Int      = 0
	@Published var screenDrag: Float    = 0.0
}

struct SnapCarousel_Previews: PreviewProvider {
	static var previews: some View {
		let uistate: UIStateModel = UIStateModel()
		SnapCarousel(UIState: uistate)
	}
}

