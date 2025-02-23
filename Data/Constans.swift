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
    City(name: "New York", country: "USA", code: "NYC"),
    City(name: "Tokyo", country: "Japan", code: "TYO"),
    City(name: "Paris", country: "France", code: "PAR"),
    City(name: "Bangkok", country: "Thailand", code: "BKK"),
    City(name: "Sydney", country: "Australia", code: "SYD"),
    City(name: "Mexico City", country: "Mexico", code: "MEX"),
    City(name: "London", country: "UK", code: "LON"),
    City(name: "Frankfurt", country: "Germany", code: "FRA"),
    City(name: "Berlin", country: "Germany", code: "BER"),
    City(name: "Madrid", country: "Spain", code: "MAD"),
    City(name: "Rome", country: "Italy", code: "ROM")
]

let sampleCostCities: [CityCost] = [
    CityCost(city: sampleCities[0], transportCost: 8, mealCost: 25, hotelCost: 100),
    CityCost(city: sampleCities[1], transportCost: 6, mealCost: 20, hotelCost: 90),
    CityCost(city: sampleCities[2], transportCost: 10, mealCost: 30, hotelCost: 110),
    CityCost(city: sampleCities[3], transportCost: 3, mealCost: 10, hotelCost: 35),
    CityCost(city: sampleCities[4], transportCost: 12, mealCost: 35, hotelCost: 120),
    CityCost(city: sampleCities[5], transportCost: 5, mealCost: 12, hotelCost: 55),
    CityCost(city: sampleCities[6], transportCost: 11, mealCost: 28, hotelCost: 120),
    CityCost(city: sampleCities[7], transportCost: 9, mealCost: 27, hotelCost: 100),
    CityCost(city: sampleCities[8], transportCost: 8, mealCost: 25, hotelCost: 95),
    CityCost(city: sampleCities[9], transportCost: 7, mealCost: 22, hotelCost: 85),
    CityCost(city: sampleCities[10], transportCost: 8, mealCost: 26, hotelCost: 90)
]

let sampleFlights: [FlightCost] = [
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
    FlightCost(fromCityCode: "TYO", toCityCode: "PAR", cost: 550),
    FlightCost(fromCityCode: "TYO", toCityCode: "BKK", cost: 300),
    FlightCost(fromCityCode: "TYO", toCityCode: "SYD", cost: 400),
    FlightCost(fromCityCode: "TYO", toCityCode: "FRA", cost: 500),
    FlightCost(fromCityCode: "TYO", toCityCode: "BER", cost: 510),
    FlightCost(fromCityCode: "TYO", toCityCode: "MAD", cost: 520),
    FlightCost(fromCityCode: "TYO", toCityCode: "ROM", cost: 530),
    FlightCost(fromCityCode: "TYO", toCityCode: "NYC", cost: 500),
    FlightCost(fromCityCode: "TYO", toCityCode: "MEX", cost: 480),
    FlightCost(fromCityCode: "TYO", toCityCode: "LON", cost: 490),
    FlightCost(fromCityCode: "PAR", toCityCode: "BKK", cost: 450),
    FlightCost(fromCityCode: "PAR", toCityCode: "SYD", cost: 550),
    FlightCost(fromCityCode: "BKK", toCityCode: "SYD", cost: 320),
    FlightCost(fromCityCode: "LON", toCityCode: "FRA", cost: 150),
    FlightCost(fromCityCode: "LON", toCityCode: "BER", cost: 160),
    FlightCost(fromCityCode: "LON", toCityCode: "MAD", cost: 140),
    FlightCost(fromCityCode: "LON", toCityCode: "ROM", cost: 170)
]
