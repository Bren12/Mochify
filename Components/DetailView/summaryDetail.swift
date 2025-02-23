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
                
                HStack {
                    Spacer()
                    Text("\(dateFormat.string(from: trip.startDate))")
                        .font(.system(size: 10))
                } // -> HStack
                
                HStack {
                    
                    Text(trip.originCode)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 45, alignment: .leading)
                    
                    Spacer()
                    
                    Image("flight")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                    
                    Text(trip.destinyCode)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(width: 45, alignment: .trailing)
                    
                } // -> HStack
                
            } // -> VStack
            .frame(height: 90)
            .padding(.top, 20)
            
            Line()
                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
            
            // MARK: EXTRA INFO
            HStack {
                
                VStack {
                    
                    Text("\(trip.numberOfTravelers)")
                        .font(.system(size: 15, weight: .heavy))
                    
                    Text("Travelers")
                        .font(.system(size: 10))
                    
                } // -> VStack
                
                Spacer()
                    .frame(width: 100)
                
                VStack {
                    
                    Text("\(daysBetween(from: trip.startDate, to: trip.finalDate)+1)")
                        .font(.system(size: 15, weight: .heavy))
                    
                    Text("Days")
                        .font(.system(size: 10))
                    
                } // -> VStack
                
            } // -> HStack
            .padding(.vertical, 20)
            .padding(.bottom, 20)
            
        } // -> VStack
        .padding(.horizontal, 30)
        .background(.white)
        .clipShape(
            TicketUpper(cornerRadius: 20, cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
}
