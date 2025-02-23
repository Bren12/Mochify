//
//  finalDetail.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct finalDetail: View {
    
    let trip: TripCostModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // MARK: DATA
            HStack {
                    
                // MARK: 1st row
                VStack(alignment: .leading) {
                    Text("")
                        .font(.system(size: 13))
                    Text("Flight")
                        .font(.system(size: 13))
                    Text("Hotel")
                        .font(.system(size: 13))
                    Text("Transport")
                        .font(.system(size: 13))
                    Text("Meal")
                        .font(.system(size: 13))
                } // -> VStack
                .layoutPriority(1)
                
                Spacer()
                
                // MARK: 2nd row
                VStack {
                    
                    Text("Individual")
                        .font(.system(size: 13))
                    
                    Text(String(
                        format: "€%.2f",
                        trip.outboundFlightCost + trip.returnFlightCost
                    )) // -> Text
                        .font(.system(size: 13, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                    Text(String(
                        format: "€%.2f",
                        getCostCity(code: trip.destinyCode).hotelCost*Double(daysBetween(from: trip.startDate, to: trip.finalDate))
                    )) // -> Text
                        .font(.system(size: 13, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                    Text(String(
                        format: "€%.2f",
                        getCostCity(code: trip.destinyCode).transportCost*Double(daysBetween(from: trip.startDate, to: trip.finalDate)+1)
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
                            .font(.system(size: 13))
                        
                        Text(String(
                            format: "€%.2f",
                            (trip.outboundFlightCost + trip.returnFlightCost)*Double(trip.numberOfTravelers)
                        )) // -> Text
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                        Text(String(
                            format: "€%.2f",
                            getCostCity(code: trip.destinyCode).hotelCost*Double(daysBetween(from: trip.startDate, to: trip.finalDate)*trip.numberOfTravelers)
                        )) // -> Text
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                        Text(String(
                            format: "€%.2f",
                            getCostCity(code: trip.destinyCode).transportCost*Double((daysBetween(from: trip.startDate, to: trip.finalDate)+1)*trip.numberOfTravelers)
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
            .padding(.bottom, 15)
            
            Line()
                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [10]))
                .frame(height: 1)
            
            // MARK: RETURN
            if trip.isRoundTrip {
                HStack {
                    
                    Text(trip.originCode)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 45, alignment: .leading)
                    
                    Spacer()
                    
                    Image("flightReturn")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                    
                    Text(trip.destinyCode)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 45, alignment: .trailing)
                    
                } // -> HStack
                
                Line()
                    .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [10]))
                    .frame(height: 1)
                
            } // -> if
            
            // MARK: TOTAL
            HStack {
                
                Text("TOTAL")
                    .font(.system(size: 20, weight: .heavy))
                    .layoutPriority(1)
                
                Line()
                    .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .frame(height: 1)
                    .offset(y: 7)
                
                Text(String(format: "€%.2f", totalTripCost(trip: trip)))
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("AccentColor"))
                    .layoutPriority(1)
                
            } // -> HStack
            .padding(.top, 10)
            
        } // -> VStack
        .padding(.horizontal, 30)
        .frame(height: trip.isRoundTrip ? 260 : 180)
        .background(.white)
        .clipShape(
            TicketBottom(cornerRadius: 20, cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
} // -> finalDetail
