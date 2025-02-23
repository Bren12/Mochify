//
//  File.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 21/02/25.
//

import Foundation

struct CityCost: Identifiable {
    
    let id = UUID()
    let name: String
    let country: String
    let code: String
    
    static let sampleCities: [City] = [
        City(name: "Mexico City", country: "Mexico", code: "MEX"),
        City(name: "Frankfurt", country: "Germany", code: "FRA"),
        City(name: "Berlin", country: "Germany", code: "BER"),
        City(name: "Madrid", country: "Spain", code: "MAD"),
        City(name: "Rome", country: "Italy", code: "ROM"),
        City(name: "New York", country: "USA", code: "NYC"),
        City(name: "Tokyo", country: "Japan", code: "TYO"),
        City(name: "Paris", country: "France", code: "PAR"),
        City(name: "London", country: "UK", code: "LON")
    ] // -> sampleCities
    
} // -> City
