//
//  CardSummary.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import SwiftUI

struct CardSummary: View {
    
    @State var trip: TripCostModel
    
    let returnTrip = true
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }
    
    var body: some View {
            
        VStack {
            
            // MARK: EXTRA DATA
            HStack {
                
                // MARK: DATE
                HStack {
                    
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color("AccentColor"))
                    
                    Text("\(dateFormat.string(from: trip.startDate))")
                        .font(.system(size: 15))
                        .foregroundStyle(Color("AccentColor"))
                    
                } // -> HStack
                .padding(.vertical, 7.5)
                .padding(.horizontal, 15)
                .background(Color("AccentColor").opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                // MARK: TRAVELERS
                HStack {
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color("AccentColor"))
                    
                    Text("\(trip.numberOfTravelers)")
                        .font(.system(size: 15))
                        .foregroundStyle(Color("AccentColor"))
                } // -> HStack
                .padding(.vertical, 7.5)
                .padding(.horizontal, 15)
                .background(Color("AccentColor").opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            } // -> HStack
            .frame(height: 65)
            .padding(.top, 7.5)
            
            Divider()
            
            // MARK: DEPARTURE
            HStack {
                
                Text(trip.originCode)
                    .font(.system(size: 20))
                    .frame(width: 45, alignment: .leading)
                
                Spacer()
                
                Image("flight")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                
                Text(trip.destinyCode)
                    .font(.system(size: 20))
                    .frame(width: 45, alignment: .trailing)
                
            } // -> HStack
            .frame(height: 65)
            
            Divider()
            // MARK: DAYS
                .overlay {
                    HStack {
                        VStack {
                            // Include the current day as 1
                            let days = daysBetween(from: trip.startDate, to: trip.finalDate) + 1
                            Text("\(days) \(days > 1 ? "days" : "day")")
                                .font(.system(size: 15))
                                .foregroundStyle(.gray)
                        } // -> VStack
                        .padding(.vertical, 5)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .stroke(Color("defaultLightGray"), lineWidth: 1)
                        ) // -> background
                    } // -> HStack
                } // -> overlay
            
            // MARK: OPTIONAL RETURN
            if trip.isRoundTrip {
                
                HStack {
                    
                    Text(trip.destinyCode)
                        .font(.system(size: 20))
                        .frame(width: 45, alignment: .leading)
                    
                    Spacer()
                    
                    Image("flight")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                    
                    Text(trip.originCode)
                        .font(.system(size: 20))
                        .frame(width: 45, alignment: .trailing)
                    
                } // -> HStack
                .frame(height: 65)
                
                Divider()
                
            } // -> if
            
            // MARK: TOTAL COST
            HStack {
                    
                Text("TOTAL")
                    .font(.system(size: 20))
                
                GeometryReader { geo in
                    
                    let availableWidth = geo.size.width
                        
                    Text(String(repeating: ".", count: Int(availableWidth/5)))
                        .font(.system(size: 20))
                        .foregroundStyle(Color("defaultLightGray"))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 21)
                    
                } // -> GeometryReader
                
                Text(String(format: "€%.2f", totalTripCost(trip: trip)))
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("AccentColor"))
                
            } // -> HStack
            .frame(height: 65)
            .padding(.bottom, 7.5)
            
        } // -> VStack
        .padding(.horizontal, 20)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .padding(.horizontal, 20)
        
    } // -> body
    
} // -> CardSummary
