//
//  DataModel.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import Foundation
import SwiftData

@Model
class TripCostModel: Identifiable {
    var cityCode: String
    var outboundFlightCost: Double
    var returnFlightCost: Double
    var departureDate: Date
    var returnDate: Date
    var numberOfTravelers: Int
    var originCity: String
    var destinationCity: String

    init(cityCode: String,
         outboundFlightCost: Double,
         returnFlightCost: Double,
         departureDate: Date,
         returnDate: Date,
         numberOfTravelers: Int,
         originCity: String,
         destinationCity: String) {
        self.cityCode = cityCode
        self.outboundFlightCost = outboundFlightCost
        self.returnFlightCost = returnFlightCost
        self.departureDate = departureDate
        self.returnDate = returnDate
        self.numberOfTravelers = numberOfTravelers
        self.originCity = originCity
        self.destinationCity = destinationCity
    }
}
