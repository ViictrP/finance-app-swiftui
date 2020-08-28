//
//  ContentView.swift
//  Finance App
//
//  Created by Victor Prado on 26/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	let uiState: UIStateModel = UIStateModel()
	
    var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .center, spacing: 30) {
				HStack {
					Text("Seus cartões")
						.font(.system(.title))
						.foregroundColor(.black)
					
					Spacer()
					
					Button("add novo") {
						
					}
				}
				.padding(.horizontal, 30)
				
				SnapCarousel(UIState: uiState)
			}
			.padding(.top, 30)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
