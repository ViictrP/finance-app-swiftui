//
//  ProgressBar.swift
//  Finance App
//
//  Created by Victor Prado on 28/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
	let HORIZONTAL_PADDING: CGFloat = 30
	@State() var tapped: Bool = false
	
    var body: some View {
		VStack(spacing: 20) {
			HStack {
				Text("Balanço")
					.font(.system(.title))
					.bold()
				Spacer()
				Text("100%")
					.font(.system(.headline))
			}
			
			Color("progressbar")
				.frame(width: tapped ? 300 : 68, height: 15)
				.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
				.frame(width: 300, height: 15, alignment: .leading)
				.animation(.spring(response: 0.45, dampingFraction: 0.7, blendDuration: 0))
				.onTapGesture {
					self.tapped = !self.tapped
				}
				.background(Color("black-faded"))
				.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
				.padding()
				.frame(width: 310, height:25)
				.background(Color("black-faded-2"))
				.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
			
			HStack(spacing: 39) {
				HStack {
					Image("arrow_down")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 24, height: 24)
					VStack(alignment: .leading, spacing: 10) {
						Text("gasto")
							.font(.body)
							.foregroundColor(Color("Subheadline"))
						Text("R$ 1.299,99")
							.font(.headline)
					}
					.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
				}
				HStack {
					Image("arrow_down_faded")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 24, height: 24)
					VStack(alignment: .leading, spacing: 10) {
						Text("disponível")
							.font(.body)
							.foregroundColor(Color("Subheadline"))
						Text("R$ 4.299,99")
							.font(.headline)
					}
					.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
				}
			}
		}
		.padding(.horizontal, HORIZONTAL_PADDING)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
