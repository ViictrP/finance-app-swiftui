//
//  ContentView.swift
//  Finance App
//
//  Created by Victor Prado on 26/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	let HORIZONTAL_PADDING: CGFloat = 30
	let uiState: UIStateModel = UIStateModel()
	@State() var tapped: Bool = false
	
    var body: some View {
		ScrollView(.vertical) {
			VStack(alignment: .center, spacing: 30) {
				HStack {
					Text("Seus cartões")
						.font(.system(.title))
						.bold()
					
					Spacer()
				
					Button("add novo") {
						
					}
				}
				.padding(.horizontal, HORIZONTAL_PADDING)
				
				SnapCarousel(UIState: uiState)
				Spacer()
				VStack(spacing: 30) {
					HStack {
						Text("Balanço")
							.font(.system(.title))
							.bold()
						Spacer()
						Text("100%")
							.font(.system(.body))
					}
					.padding(.horizontal, HORIZONTAL_PADDING)
					
					Color.blue
						.frame(width: tapped ? 300 : 68, height: 15)
						.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
						.frame(width: 300, height: 15, alignment: .leading)
						.animation(.spring(response: 0.45, dampingFraction: 0.7, blendDuration: 0))
						.onTapGesture {
							self.tapped = !self.tapped
						}
						.background(Color.black.opacity(0.07))
						.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
						.padding()
						.frame(width: 310, height:25)
						.background(Color.black.opacity(0.05))
						.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
						
				}

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
