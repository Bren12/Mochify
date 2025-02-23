//
//  mealDetail.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct mealDetail: View {
    
    let trip: TripCostModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // MARK: DATA
            HStack {
                    
                // MARK: 1st row
                VStack(alignment: .leading) {
                    Text("")
                        .font(.system(size: 13))
                    Text("Day")
                        .foregroundStyle(.black)
                        .font(.system(size: 13))
                    Text("Total")
                        .foregroundStyle(.black)
                        .font(.system(size: 13))
                } // -> VStack
                .layoutPriority(1)
                
                Spacer()
                
                // MARK: 2nd row
                VStack {
                    
                    Text("Individual")
                        .foregroundStyle(.black)
                        .font(.system(size: 13))
                    
                    Text(String(
                        format: "€%.2f",
                        getCostCity(code: trip.destinyCode).mealCost
                    )) // -> Text
                        .font(.system(size: 13, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                    Text(String(
                        format: "€%.2f",
                        getCostCity(code: trip.destinyCode).mealCost*Double(daysBetween(from: trip.startDate, to: trip.finalDate)+1)
                    )) // -> Text
                        .font(.system(size: 13, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                } // -> VStack
                .layoutPriority(1)
                
                // MARK: 3rd row
                if trip.numberOfTravelers > 1 {
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("Group")
                            .foregroundStyle(.black)
                            .font(.system(size: 13))
                        
                        Text(String(
                            format: "€%.2f",
                            getCostCity(code: trip.destinyCode).mealCost*Double(trip.numberOfTravelers)
                        )) // -> Text
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                        Text(String(
                            format: "€%.2f",
                            getCostCity(code: trip.destinyCode).mealCost*Double((daysBetween(from: trip.startDate, to: trip.finalDate)+1)*trip.numberOfTravelers)
                        )) // -> Text
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                    } // -> VStack
                    .layoutPriority(1)
                    
                } // -> if
                
            } // -> HStack
            .frame(height: 50)
            .padding(.bottom, 25)
            
            Line()
                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [10]))
                .frame(height: 1)
            
            // MARK: TOTAL
            HStack {
                
                Text("MEAL")
                    .foregroundStyle(.black)
                    .font(.system(size: 20, weight: .heavy))
                    .layoutPriority(1)
                
                Line()
                    .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .frame(height: 1)
                    .offset(y: 7)
                
                Text(String(
                    format: "€%.2f",
                    getCostCity(code: trip.destinyCode).mealCost*Double((daysBetween(from: trip.startDate, to: trip.finalDate)+1)*trip.numberOfTravelers)
                )) // -> Text
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("AccentColor"))
                    .layoutPriority(1)
                
            } // -> HStack
            .padding(.top, 10)
            
        } // -> VStack
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
        .frame(height: 200)
        .background(.white)
        .clipShape(
            TicketMiddle(cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
} // -> mealDetail
