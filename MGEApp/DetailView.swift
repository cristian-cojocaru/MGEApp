//
//  DetailView.swift
//  MGEApp
//
//  Created by Cristian Cojocaru on 23.02.2021.
//

import SwiftUI

struct DetailView: View {

	@Binding
	var selected: Country
	@Binding
	var show: Bool
	var animation: Namespace.ID

	var body: some View {
		VStack {
			ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
				Image(selected.imageName)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(height: 350)
					.clipShape(Rectangle())
					.matchedGeometryEffect(id: selected.imageName, in: animation)
					.onTapGesture {
						withAnimation(.spring()) {
							show.toggle()
						}
					}

				VStack {
					Text(selected.name)
						.font(.system(size: 20))

					Text(selected.description)
						.font(.system(size: 15))
				}
				.padding()
				.foregroundColor(.white)
				.frame(maxWidth: .infinity)
				.background(
					Color.gray
						.cornerRadius(10)
						.opacity(0.7)
				)
				.matchedGeometryEffect(id: selected.name, in: animation)
			}

			Spacer(minLength: 0)
		}
	}

}
