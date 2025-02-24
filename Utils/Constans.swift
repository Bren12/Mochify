//
//  Constants.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import Foundation

let holidayDates: Set<DateComponents> = [
    DateComponents(month: 1, day: 1),   // New Year
    DateComponents(month: 2, day: 14),  // Valentine's Day
    DateComponents(month: 5, day: 1),   // Labor Day
    DateComponents(month: 10, day: 31), // Halloween
    DateComponents(month: 12, day: 25)  // Christmas
]

let dummyCity: City = City(name: "", country: "", code: "")

let sampleCities: [City] = [
    City(name: "Mexico City", country: "Mexico", code: "MEX"),
    City(name: "Frankfurt", country: "Germany", code: "FRA"),
    City(name: "Madrid", country: "Spain", code: "MAD"),
    City(name: "New York", country: "USA", code: "NYC"),
    City(name: "Tokyo", country: "Japan", code: "TYO"),
    City(name: "Paris", country: "France", code: "PAR"),
    City(name: "Bangkok", country: "Thailand", code: "BKK"),
    City(name: "Sydney", country: "Australia", code: "SYD"),
    City(name: "London", country: "UK", code: "LON"),
    City(name: "Berlin", country: "Germany", code: "BER"),
    City(name: "Rome", country: "Italy", code: "ROM")
]

let dummyCostCity: CityCost = CityCost(city: dummyCity, transportCost: 0, mealCost: 0, hotelCost: 0)

let sampleCostCities: [CityCost] = [
    CityCost(city: sampleCities[0], transportCost: 5, mealCost: 12, hotelCost: 55),
    CityCost(city: sampleCities[1], transportCost: 9, mealCost: 27, hotelCost: 100),
    CityCost(city: sampleCities[2], transportCost: 7, mealCost: 22, hotelCost: 85),
    CityCost(city: sampleCities[3], transportCost: 8, mealCost: 25, hotelCost: 100),
    CityCost(city: sampleCities[4], transportCost: 6, mealCost: 20, hotelCost: 90),
    CityCost(city: sampleCities[5], transportCost: 10, mealCost: 30, hotelCost: 110),
    CityCost(city: sampleCities[6], transportCost: 3, mealCost: 10, hotelCost: 35),
    CityCost(city: sampleCities[7], transportCost: 12, mealCost: 35, hotelCost: 120),
    CityCost(city: sampleCities[8], transportCost: 11, mealCost: 28, hotelCost: 120),
    CityCost(city: sampleCities[9], transportCost: 8, mealCost: 25, hotelCost: 95),
    CityCost(city: sampleCities[10], transportCost: 8, mealCost: 26, hotelCost: 90)
]

let sampleFlights: [FlightCost] = [
    FlightCost(fromCityCode: "MEX", toCityCode: "FRA", cost: 490),
    FlightCost(fromCityCode: "MEX", toCityCode: "NYC", cost: 320),
    FlightCost(fromCityCode: "MEX", toCityCode: "TYO", cost: 490),
    FlightCost(fromCityCode: "MEX", toCityCode: "PAR", cost: 470),
    FlightCost(fromCityCode: "MEX", toCityCode: "BKK", cost: 460),
    FlightCost(fromCityCode: "MEX", toCityCode: "SYD", cost: 500),
    FlightCost(fromCityCode: "MEX", toCityCode: "LON", cost: 480),
    FlightCost(fromCityCode: "MEX", toCityCode: "BER", cost: 470),
    FlightCost(fromCityCode: "MEX", toCityCode: "MAD", cost: 450),
    FlightCost(fromCityCode: "MEX", toCityCode: "ROM", cost: 460),
    
    FlightCost(fromCityCode: "FRA", toCityCode: "MEX", cost: 500),
    FlightCost(fromCityCode: "FRA", toCityCode: "NYC", cost: 470),
    FlightCost(fromCityCode: "FRA", toCityCode: "TYO", cost: 510),
    FlightCost(fromCityCode: "FRA", toCityCode: "PAR", cost: 160),
    FlightCost(fromCityCode: "FRA", toCityCode: "BKK", cost: 490),
    FlightCost(fromCityCode: "FRA", toCityCode: "SYD", cost: 530),
    FlightCost(fromCityCode: "FRA", toCityCode: "LON", cost: 150),
    FlightCost(fromCityCode: "FRA", toCityCode: "BER", cost: 120),
    FlightCost(fromCityCode: "FRA", toCityCode: "MAD", cost: 200),
    FlightCost(fromCityCode: "FRA", toCityCode: "ROM", cost: 210),
    
    FlightCost(fromCityCode: "MAD", toCityCode: "NYC", cost: 430),
    FlightCost(fromCityCode: "MAD", toCityCode: "TYO", cost: 520),
    FlightCost(fromCityCode: "MAD", toCityCode: "PAR", cost: 175),
    FlightCost(fromCityCode: "MAD", toCityCode: "BKK", cost: 440),
    FlightCost(fromCityCode: "MAD", toCityCode: "SYD", cost: 550),
    FlightCost(fromCityCode: "MAD", toCityCode: "MEX", cost: 450),
    FlightCost(fromCityCode: "MAD", toCityCode: "LON", cost: 195),
    FlightCost(fromCityCode: "MAD", toCityCode: "FRA", cost: 200),
    FlightCost(fromCityCode: "MAD", toCityCode: "BER", cost: 190),
    FlightCost(fromCityCode: "MAD", toCityCode: "ROM", cost: 180),
    
    FlightCost(fromCityCode: "NYC", toCityCode: "TYO", cost: 500),
    FlightCost(fromCityCode: "NYC", toCityCode: "PAR", cost: 450),
    FlightCost(fromCityCode: "NYC", toCityCode: "BKK", cost: 350),
    FlightCost(fromCityCode: "NYC", toCityCode: "SYD", cost: 600),
    FlightCost(fromCityCode: "NYC", toCityCode: "MEX", cost: 300),
    FlightCost(fromCityCode: "NYC", toCityCode: "LON", cost: 500),
    FlightCost(fromCityCode: "NYC", toCityCode: "FRA", cost: 460),
    FlightCost(fromCityCode: "NYC", toCityCode: "BER", cost: 470),
    FlightCost(fromCityCode: "NYC", toCityCode: "MAD", cost: 420),
    FlightCost(fromCityCode: "NYC", toCityCode: "ROM", cost: 430),
    
    FlightCost(fromCityCode: "TYO", toCityCode: "NYC", cost: 520),
    FlightCost(fromCityCode: "TYO", toCityCode: "PAR", cost: 550),
    FlightCost(fromCityCode: "TYO", toCityCode: "BKK", cost: 300),
    FlightCost(fromCityCode: "TYO", toCityCode: "SYD", cost: 400),
    FlightCost(fromCityCode: "TYO", toCityCode: "MEX", cost: 480),
    FlightCost(fromCityCode: "TYO", toCityCode: "LON", cost: 490),
    FlightCost(fromCityCode: "TYO", toCityCode: "FRA", cost: 500),
    FlightCost(fromCityCode: "TYO", toCityCode: "BER", cost: 510),
    FlightCost(fromCityCode: "TYO", toCityCode: "MAD", cost: 520),
    FlightCost(fromCityCode: "TYO", toCityCode: "ROM", cost: 530),
    
    FlightCost(fromCityCode: "PAR", toCityCode: "NYC", cost: 460),
    FlightCost(fromCityCode: "PAR", toCityCode: "TYO", cost: 570),
    FlightCost(fromCityCode: "PAR", toCityCode: "BKK", cost: 450),
    FlightCost(fromCityCode: "PAR", toCityCode: "SYD", cost: 550),
    FlightCost(fromCityCode: "PAR", toCityCode: "MEX", cost: 460),
    FlightCost(fromCityCode: "PAR", toCityCode: "LON", cost: 180),
    FlightCost(fromCityCode: "PAR", toCityCode: "FRA", cost: 160),
    FlightCost(fromCityCode: "PAR", toCityCode: "BER", cost: 170),
    FlightCost(fromCityCode: "PAR", toCityCode: "MAD", cost: 175),
    FlightCost(fromCityCode: "PAR", toCityCode: "ROM", cost: 190),
    
    FlightCost(fromCityCode: "BKK", toCityCode: "NYC", cost: 370),
    FlightCost(fromCityCode: "BKK", toCityCode: "TYO", cost: 320),
    FlightCost(fromCityCode: "BKK", toCityCode: "PAR", cost: 470),
    FlightCost(fromCityCode: "BKK", toCityCode: "SYD", cost: 320),
    FlightCost(fromCityCode: "BKK", toCityCode: "MEX", cost: 470),
    FlightCost(fromCityCode: "BKK", toCityCode: "LON", cost: 490),
    FlightCost(fromCityCode: "BKK", toCityCode: "FRA", cost: 450),
    FlightCost(fromCityCode: "BKK", toCityCode: "BER", cost: 460),
    FlightCost(fromCityCode: "BKK", toCityCode: "MAD", cost: 440),
    FlightCost(fromCityCode: "BKK", toCityCode: "ROM", cost: 460),
    
    FlightCost(fromCityCode: "SYD", toCityCode: "NYC", cost: 620),
    FlightCost(fromCityCode: "SYD", toCityCode: "TYO", cost: 420),
    FlightCost(fromCityCode: "SYD", toCityCode: "PAR", cost: 560),
    FlightCost(fromCityCode: "SYD", toCityCode: "BKK", cost: 330),
    FlightCost(fromCityCode: "SYD", toCityCode: "MEX", cost: 510),
    FlightCost(fromCityCode: "SYD", toCityCode: "LON", cost: 520),
    FlightCost(fromCityCode: "SYD", toCityCode: "FRA", cost: 530),
    FlightCost(fromCityCode: "SYD", toCityCode: "BER", cost: 540),
    FlightCost(fromCityCode: "SYD", toCityCode: "MAD", cost: 550),
    FlightCost(fromCityCode: "SYD", toCityCode: "ROM", cost: 570),
    
    FlightCost(fromCityCode: "LON", toCityCode: "NYC", cost: 520),
    FlightCost(fromCityCode: "LON", toCityCode: "TYO", cost: 530),
    FlightCost(fromCityCode: "LON", toCityCode: "PAR", cost: 180),
    FlightCost(fromCityCode: "LON", toCityCode: "BKK", cost: 490),
    FlightCost(fromCityCode: "LON", toCityCode: "SYD", cost: 510),
    FlightCost(fromCityCode: "LON", toCityCode: "MEX", cost: 480),
    FlightCost(fromCityCode: "LON", toCityCode: "FRA", cost: 150),
    FlightCost(fromCityCode: "LON", toCityCode: "BER", cost: 160),
    FlightCost(fromCityCode: "LON", toCityCode: "MAD", cost: 140),
    FlightCost(fromCityCode: "LON", toCityCode: "ROM", cost: 170),
    
    FlightCost(fromCityCode: "BER", toCityCode: "NYC", cost: 480),
    FlightCost(fromCityCode: "BER", toCityCode: "TYO", cost: 520),
    FlightCost(fromCityCode: "BER", toCityCode: "PAR", cost: 170),
    FlightCost(fromCityCode: "BER", toCityCode: "BKK", cost: 470),
    FlightCost(fromCityCode: "BER", toCityCode: "SYD", cost: 540),
    FlightCost(fromCityCode: "BER", toCityCode: "MEX", cost: 480),
    FlightCost(fromCityCode: "BER", toCityCode: "LON", cost: 185),
    FlightCost(fromCityCode: "BER", toCityCode: "FRA", cost: 120),
    FlightCost(fromCityCode: "BER", toCityCode: "MAD", cost: 190),
    FlightCost(fromCityCode: "BER", toCityCode: "ROM", cost: 200),
    
    FlightCost(fromCityCode: "ROM", toCityCode: "NYC", cost: 440),
    FlightCost(fromCityCode: "ROM", toCityCode: "TYO", cost: 540),
    FlightCost(fromCityCode: "ROM", toCityCode: "PAR", cost: 190),
    FlightCost(fromCityCode: "ROM", toCityCode: "BKK", cost: 460),
    FlightCost(fromCityCode: "ROM", toCityCode: "SYD", cost: 570),
    FlightCost(fromCityCode: "ROM", toCityCode: "MEX", cost: 460),
    FlightCost(fromCityCode: "ROM", toCityCode: "LON", cost: 200),
    FlightCost(fromCityCode: "ROM", toCityCode: "FRA", cost: 210),
    FlightCost(fromCityCode: "ROM", toCityCode: "BER", cost: 200),
    FlightCost(fromCityCode: "ROM", toCityCode: "MAD", cost: 180)
]

let warningText: String = "⚠️ If your trip lasts only one day (e.g., May 28, 2025 - May 28, 2025), the accommodation cost will be $0, as there is no overnight stay. However, transportation, meals, and flights will still be included in the calculation, reflecting the cost for that day. Please review the breakdown carefully to ensure the estimate meets your expectations."
