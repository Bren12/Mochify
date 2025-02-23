//
//  summaryDetail.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct summaryDetail: View {
    
    let trip: TripCostModel
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }
    
    var body: some View {
        
        VStack {
            
            // MARK: DEPARTURE
            VStack(spacing: 0) {
                
                // MARK: DATE
                HStack {
                    Spacer()
                    Text("\(dateFormat.string(from: trip.startDate))  -  \(dateFormat.string(from: trip.finalDate))")
                        .font(.system(size: 10))
                } // -> HStack
                
                // MARK: FLIGHT
                HStack {
                    
                    VStack {
                        Text(trip.originCode)
                            .font(.system(size: 20, weight: .heavy))
                            .frame(width: 50)
                        Text(getCity(code: trip.originCode))
                            .font(.system(size: 10))
                            .frame(width: 50, alignment: .center)
                    } // -> VStack
                    
                    Spacer()
                    
                    Image("flightDeparture")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                    
                    VStack {
                        Text(trip.destinyCode)
                            .font(.system(size: 20, weight: .heavy))
                            .frame(width: 50)
                        Text(getCity(code: trip.destinyCode))
                            .font(.system(size: 10))
                            .frame(width: 50, alignment: .center)
                    } // -> VStack
                    
                } // -> HStack
                
            } // -> VStack
            
            Line()
                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [10]))
                .frame(height: 1)
            
            // MARK: EXTRA INFO
            HStack {
                
                VStack {
                    Text("\(trip.numberOfTravelers)")
                        .font(.system(size: 17, weight: .heavy))
                    Text("Travelers")
                        .font(.system(size: 13))
                    
                } // -> VStack
                
                Spacer()
                    .frame(width: 100)
                
                VStack {
                    Text("\(daysBetween(from: trip.startDate, to: trip.finalDate)+1)")
                        .font(.system(size: 17, weight: .heavy))
                    Text("Days")
                        .font(.system(size: 13))
                } // -> VStack
                
            } // -> HStack
            .padding(.vertical, 5)
            
        } // -> VStack
        .padding(.vertical, 30)
        .padding(.horizontal, 30)
        .background(.white)
        .clipShape(
            TicketUpper(cornerRadius: 20, cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
}
