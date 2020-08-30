//
//  HomeView.swift
//  Finance App
//
//  Created by Victor Prado on 30/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct HomeView: View {
	@State private var selected = 0
	
	var body: some View {
		TabView(selection: $selected) {
			CreditCardView()
				.tabItem {
					Image("creditcard")
						.renderingMode(.template)
						.foregroundColor(.black)
				}
				.onTapGesture { self.selected = 1 }
				.tag(1)
			
			Text("Carteira")
				.tabItem {
					Image("wallet")
						.renderingMode(.template)
						.foregroundColor(.black)
				}
				.onTapGesture { self.selected = 2 }
				.tag(2)
			
			Text("Buscar")
				.tabItem {
					Image("search")
						.renderingMode(.template)
						.foregroundColor(.black)
				}
				.onTapGesture { self.selected = 3 }
				.tag(3)
		}
	}
	
}


struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
