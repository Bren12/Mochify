//
//  City.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import Foundation

struct City: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let country: String
    let code: String
} // -> CityCost
