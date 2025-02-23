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

let sampleCities: [CityCost] = [
    CityCost(name: "New York", country: "USA", code: "NYC", transportCost: 8, mealCost: 25, hotelCost: 100),
    CityCost(name: "Tokyo", country: "Japan", code: "TYO", transportCost: 6, mealCost: 20, hotelCost: 90),
    CityCost(name: "Paris", country: "France", code: "PAR", transportCost: 10, mealCost: 30, hotelCost: 110),
    CityCost(name: "Bangkok", country: "Thailand", code: "BKK", transportCost: 3, mealCost: 10, hotelCost: 35),
    CityCost(name: "Sydney", country: "Australia", code: "SYD", transportCost: 12, mealCost: 35, hotelCost: 120),
    CityCost(name: "Mexico City", country: "Mexico", code: "MEX", transportCost: 5, mealCost: 12, hotelCost: 55),
    CityCost(name: "London", country: "UK", code: "LON", transportCost: 11, mealCost: 28, hotelCost: 120),
    CityCost(name: "Frankfurt", country: "Germany", code: "FRA", transportCost: 9, mealCost: 27, hotelCost: 100),
    CityCost(name: "Berlin", country: "Germany", code: "BER", transportCost: 8, mealCost: 25, hotelCost: 95),
    CityCost(name: "Madrid", country: "Spain", code: "MAD", transportCost: 7, mealCost: 22, hotelCost: 85),
    CityCost(name: "Rome", country: "Italy", code: "ROM", transportCost: 8, mealCost: 26, hotelCost: 90)
]

let sampleFlights: [FlightCost] = [
    FlightCost(fromCity: "New York", toCity: "Tokyo", cost: 500),
    FlightCost(fromCity: "New York", toCity: "Paris", cost: 450),
    FlightCost(fromCity: "New York", toCity: "Bangkok", cost: 350),
    FlightCost(fromCity: "New York", toCity: "Sydney", cost: 600),
    FlightCost(fromCity: "New York", toCity: "Mexico City", cost: 300),
    FlightCost(fromCity: "New York", toCity: "London", cost: 500),
    FlightCost(fromCity: "New York", toCity: "Frankfurt", cost: 460),
    FlightCost(fromCity: "New York", toCity: "Berlin", cost: 470),
    FlightCost(fromCity: "New York", toCity: "Madrid", cost: 420),
    FlightCost(fromCity: "New York", toCity: "Rome", cost: 430),
    FlightCost(fromCity: "Tokyo", toCity: "Paris", cost: 550),
    FlightCost(fromCity: "Tokyo", toCity: "Bangkok", cost: 300),
    FlightCost(fromCity: "Tokyo", toCity: "Sydney", cost: 400),
    FlightCost(fromCity: "Tokyo", toCity: "Frankfurt", cost: 500),
    FlightCost(fromCity: "Tokyo", toCity: "Berlin", cost: 510),
    FlightCost(fromCity: "Tokyo", toCity: "Madrid", cost: 520),
    FlightCost(fromCity: "Tokyo", toCity: "Rome", cost: 530),
    FlightCost(fromCity: "Tokyo", toCity: "New York", cost: 500),
    FlightCost(fromCity: "Tokyo", toCity: "Mexico City", cost: 480),
    FlightCost(fromCity: "Tokyo", toCity: "London", cost: 490),
    FlightCost(fromCity: "Paris", toCity: "Bangkok", cost: 450),
    FlightCost(fromCity: "Paris", toCity: "Sydney", cost: 550),
    FlightCost(fromCity: "Bangkok", toCity: "Sydney", cost: 320),
    FlightCost(fromCity: "London", toCity: "Frankfurt", cost: 150),
    FlightCost(fromCity: "London", toCity: "Berlin", cost: 160),
    FlightCost(fromCity: "London", toCity: "Madrid", cost: 140),
    FlightCost(fromCity: "London", toCity: "Rome", cost: 170)
]
