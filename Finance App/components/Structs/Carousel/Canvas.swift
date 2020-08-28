//
//  Canvas.swift
//  Finance App
//
//  Created by Victor Prado on 27/08/20.
//  Copyright © 2020 ViictrP. All rights reserved.
//

import Foundation
import SwiftUI

struct Canvas<Content : View> : View {
	let content: Content
	@EnvironmentObject var UIState: UIStateModel
	
	@inlinable init(@ViewBuilder _ content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		content
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
			.background(Color.white.edgesIgnoringSafeArea(.all))
	}
}
