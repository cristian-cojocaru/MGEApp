//
//  Mocks.swift
//  MGEApp
//
//  Created by Cristian Cojocaru on 23.02.2021.
//

import Foundation

struct Mocks {
	
	static let countries: [Country] = [
		Country(name: "U.S.A", description: "San Francisco Bridge", imageName: "usa"),
		Country(name: "Italy", description: "Beautiful city at the sea", imageName: "italy"),
		Country(name: "Romania", description: "Ciucaș Peak", imageName: "romania"),
		Country(name: "Brazil", description: "Rio de Janeiro", imageName: "brazil")
	]

}

struct Country: Identifiable {
	let id: UUID = UUID()
	let name: String
	let description: String
	let imageName: String
}
