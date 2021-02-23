//
//  ContentView.swift
//  MGEApp
//
//  Created by Cristian Cojocaru on 22.02.2021.
//

import SwiftUI

struct ContentView: View {

	@Namespace
	var animation
	@State
	var isDetailVisible = false
	@State
	var selected: Country = Mocks.countries.first!

	var body: some View {

		ZStack {
			if isDetailVisible {
				DetailView(selected: $selected, show: $isDetailVisible, animation: animation)
			} else {
				ScrollView(.vertical, showsIndicators: false) {
					VStack {
						ForEach(Mocks.countries) {
							ContentRow(country: $0, animation: animation, selected: $selected, isShowing: $isDetailVisible)
						}
					}
				}
			}
		}
	}

}

struct ContentRow: View {

	let country: Country
	let animation: Namespace.ID
	@Binding
	var selected: Country
	@Binding
	var isShowing: Bool

	var body: some View {
		ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
			Image(country.imageName)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(height: 300)
				.cornerRadius(25)
				.matchedGeometryEffect(id: country.imageName, in: animation)

			VStack {
				Spacer()

				Text(country.name)
					.font(.system(size: 25))

				Text(country.description)
					.font(.system(size: 20))

				Spacer()
			}
			.padding()
			.foregroundColor(.white)
			.frame(maxWidth: .infinity)
			.background(
				Color.gray
					.cornerRadius(10)
					.opacity(0)
			)
			.matchedGeometryEffect(id: country.name, in: animation)

		}
		.padding()
		.onTapGesture {
			withAnimation(.spring()) {
				selected = country
				isShowing.toggle()
			}
		}
	}

}
