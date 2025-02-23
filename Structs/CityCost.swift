//
//  File.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 21/02/25.
//

import Foundation

struct CityCost: Identifiable {
    
    let id = UUID()
    let city: City
    let transportCost: Double
    let mealCost: Double
    let hotelCost: Double
    
    func totalCost(forDays days: Int) -> Double {
        (transportCost * Double(days)) + (mealCost * Double(days)) + (hotelCost * Double(days > 1 ? days : 0))
    } // -> totalCost
    
} // -> CityCost
