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
        
        VStack {
            
            // MARK: RETURN
            if trip.isRoundTrip {
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
                .frame(height: 100)
                
                Line()
                    .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                
            } // -> if
            
            // MARK: TOTAL
            HStack {
                
                Text("TOTAL")
                    .font(.system(size: 20, weight: .heavy))
                
                GeometryReader { geo in
                    
                    let availableWidth = geo.size.width
                    
                    Text(String(repeating: ".", count: Int(availableWidth/4)))
                        .font(.system(size: 15))
                        .foregroundStyle(Color("defaultLightGray"))
                        .frame(maxWidth: .infinity)
                    
                } // -> GeometryReader
                .frame(height: 12)
                
                Text(String(format: "€%.2f", totalTripCost(trip: trip)))
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundStyle(Color("AccentColor"))
                
            } // -> HStack
            .padding(.vertical, 20)
            .padding(.bottom, 10)
            
        } // -> VStack
        .padding(.horizontal, 30)
        .frame(height: 150)
        .background(.white)
        .clipShape(
            TicketBottom(cornerRadius: 20, cutRadius: 20)
        ) // -> clipShape
        
    } // -> body
    
} // -> finalDetail
