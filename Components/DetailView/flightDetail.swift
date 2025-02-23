//
//  SwiftUIView.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 23/02/25.
//

import SwiftUI

struct flightDetail: View {
    
    let trip: TripCostModel
    
    var body: some View {
        
        VStack {
            
            // MARK: DATA
            VStack {
                
                // MARK: SUBHEADERS FOR TRAVELERS
                if trip.numberOfTravelers > 1 {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("Individual")
                            .font(.system(size: 10))
                            .padding(.horizontal, 70)
                        
                        Text("Group")
                            .font(.system(size: 10))
                            .padding(.horizontal, 5)
                        
                    } // -> HStack
                    
                } // -> if
                
                // MARK: DEPARTURE
                HStack {
                    
                    Text("Departure")
                        .font(.system(size: 10))
                        .frame(width: 50, alignment: .leading)
                    
                    GeometryReader { geo in
                        
                        let availableWidth = geo.size.width
                        
                        Text(String(repeating: ".", count: Int(availableWidth/4)))
                            .font(.system(size: 15))
                            .foregroundStyle(Color("defaultLightGray"))
                            .frame(maxWidth: .infinity)
                        
                    } // -> GeometryReader
                    .frame(height: 20)
                    
                    Text(String(format: "€%.2f", trip.outboundFlightCost))
                        .font(.system(size: 10, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                    if trip.numberOfTravelers > 1 {
                        
                        GeometryReader { geo in
                            
                            let availableWidth = geo.size.width
                            
                            Text(String(repeating: ".", count: Int(availableWidth/4)))
                                .font(.system(size: 15))
                                .foregroundStyle(Color("defaultLightGray"))
                                .frame(maxWidth: .infinity)
                            
                        } // -> GeometryReader
                        .frame(height: 20)
                        
                        Text(String(format: "€%.2f", trip.outboundFlightCost*Double(trip.numberOfTravelers)))
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                    } // -> if
                    
                } // -> HStack
                
                if trip.isRoundTrip {
                    
                    // MARK: RETURN
                    HStack {
                        
                        Text("Return")
                            .font(.system(size: 10))
                            .frame(width: 50, alignment: .leading)
                        
                        GeometryReader { geo in
                            
                            let availableWidth = geo.size.width
                            
                            Text(String(repeating: ".", count: Int(availableWidth/4)))
                                .font(.system(size: 15))
                                .foregroundStyle(Color("defaultLightGray"))
                                .frame(maxWidth: .infinity)
                            
                        } // -> GeometryReader
                        .frame(height: 20)
                        
                        Text(String(format: "€%.2f", trip.returnFlightCost))
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                        if trip.numberOfTravelers > 1 {
                            
                            GeometryReader { geo in
                                
                                let availableWidth = geo.size.width
                                
                                Text(String(repeating: ".", count: Int(availableWidth/4)))
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color("defaultLightGray"))
                                    .frame(maxWidth: .infinity)
                                
                            } // -> GeometryReader
                            .frame(height: 20)
                            
                            Text(String(format: "€%.2f", (trip.returnFlightCost)*Double(trip.numberOfTravelers)))
                                .font(.system(size: 10, weight: .heavy))
                                .foregroundStyle(Color("AccentColor"))
                            
                        } // -> if
                        
                    } // -> HStack
                    
                } // -> if
                
                // MARK: TOTAL
                HStack {
                    
                    Text("Total")
                        .font(.system(size: 10))
                        .frame(width: 50, alignment: .leading)
                    
                    GeometryReader { geo in
                        
                        let availableWidth = geo.size.width
                        
                        Text(String(repeating: ".", count: Int(availableWidth/4)))
                            .font(.system(size: 15))
                            .foregroundStyle(Color("defaultLightGray"))
                            .frame(maxWidth: .infinity)
                        
                    } // -> GeometryReader
                    .frame(height: 20)
                    
                    Text(String(format: "€%.2f", trip.outboundFlightCost + trip.returnFlightCost))
                        .font(.system(size: 10, weight: .heavy))
                        .foregroundStyle(Color("AccentColor"))
                    
                    if trip.numberOfTravelers > 1 {
                        
                        GeometryReader { geo in
                            
                            let availableWidth = geo.size.width
                            
                            Text(String(repeating: ".", count: Int(availableWidth/4)))
                                .font(.system(size: 15))
                                .foregroundStyle(Color("defaultLightGray"))
                                .frame(maxWidth: .infinity)
                            
                        } // -> GeometryReader
                        .frame(height: 20)
                        
                        Text(String(format: "€%.2f", (trip.outboundFlightCost + trip.returnFlightCost)*Double(trip.numberOfTravelers)))
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                    } // -> if
                    
                } // -> HStack
                
            } // -> VStack
            .padding(.vertical, 20)
            
            Line()
                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
            
            // MARK: TOTAL
            HStack {
                
                Text("FLIGHT")
                    .font(.system(size: 20, weight: .heavy))
                
                GeometryReader { geo in
                    
                    let availableWidth = geo.size.width
                    
                    Text(String(repeating: ".", count: Int(availableWidth/4)))
                        .font(.system(size: 15))
                        .foregroundStyle(Color("defaultLightGray"))
                        .frame(maxWidth: .infinity)
                    
                } // -> GeometryReader
                .frame(height: 12)
                
                Text(String(format: "€%.2f", (trip.outboundFlightCost + trip.returnFlightCost)*Double(trip.numberOfTravelers)))
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("AccentColor"))
                
            } // -> HStack
            .padding(.vertical, 20)
            .padding(.bottom, 10)
            
        } // -> VStack
        .padding(.horizontal, 30)
        .frame(height: 200)
        .background(.white)
        .clipShape(
            TicketMiddle(cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
} // -> flightDetail
