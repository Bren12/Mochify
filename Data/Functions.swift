//
//  File.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import Foundation

func searchCity(code: String) -> String {
    sampleCities.first { $0.code == code }?.name ?? "???"
}

func isHoliday(date: Date) -> Bool {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.month, .day], from: date)
    
    return holidayDates.contains { holiday in
        holiday.month == components.month && holiday.day == components.day
    }
}

func adjustedFlightCost(from: String, to: String, flightDate: Date) -> Double {
    let baseCost = sampleFlights.first { $0.fromCityCode == from && $0.toCityCode == to }?.cost ?? 0
    let holidaySurcharge = 1.2
    
    if isHoliday(date: flightDate) {
        return baseCost * holidaySurcharge
    }
    return baseCost
}

func daysBetween(from: Date, to: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: from, to: to)
    return components.day ?? 0
}

func totalCostLiving(code: String, days: Int, travelers: Int) -> Double {
    (sampleCostCities.first { $0.city.code == code }?.totalCost(forDays: days) ?? 0) * Double(travelers)
}// -> totalCostLiving

func totalTripCost(trip: TripCostModel) -> Double {
    let totalflightCost = (trip.outboundFlightCost + trip.returnFlightCost) * Double(trip.numberOfTravelers)
    let days = daysBetween(from: trip.startDate, to: trip.finalDate) + 1
    let totalCostLiving = totalCostLiving(code: trip.destinyCode, days: days, travelers: trip.numberOfTravelers)
    return totalflightCost + totalCostLiving
//    return totalflightCost + totalCostLiving
}// -> totalTripCost
