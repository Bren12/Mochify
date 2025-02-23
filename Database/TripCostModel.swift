//
//  TripCostModel.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import Foundation
import SwiftData

@Model
class TripCostModel: Identifiable {
    var id: String
    var originCode: String
    var destinyCode: String
    var isRoundTrip: Bool
    var outboundFlightCost: Double
    var returnFlightCost: Double
    var startDate: Date
    var finalDate: Date
    var numberOfTravelers: Int

    init(originCode: String,
         destinyCode: String,
         outboundFlightCost: Double,
         returnFlightCost: Double,
         startDate: Date,
         finalDate: Date,
         numberOfTravelers: Int) {
        self.id = UUID().uuidString
        self.originCode = originCode
        self.destinyCode = destinyCode
        self.isRoundTrip = returnFlightCost > 0 ? true : false
        self.outboundFlightCost = outboundFlightCost
        self.returnFlightCost = returnFlightCost
        self.startDate = startDate
        self.finalDate = finalDate
        self.numberOfTravelers = numberOfTravelers
    } // -> init
} // -> TripCostModel
