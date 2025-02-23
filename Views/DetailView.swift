//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Binding var selectedTab: Int
    @Binding var navigateToDetail: Bool
    
    @State var trip: TripCostModel
    
    var tripAux : TripCostModel = TripCostModel(originCode: "MEX", destinyCode: "FRA", outboundFlightCost: 50, returnFlightCost: 100, startDate: Date(), finalDate: Date(), numberOfTravelers: 2)
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }
    
    var body: some View {
        
        ZStack {
            
            Color("background")
            
            VStack(spacing: 0) {
                
                // MARK: TOP
                VStack {
                    
                    // MARK: DEPARTURE
                    VStack(spacing: 0) {
                        
                        HStack {
                            Spacer()
                            Text("\(dateFormat.string(from: tripAux.startDate))")
                                .font(.system(size: 10))
                        } // -> HStack
                        
                        HStack {
                            
                            Text(tripAux.originCode)
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 45, alignment: .leading)
                            
                            Spacer()
                            
                            Image("flight")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                            Spacer()
                            
                            Text(tripAux.destinyCode)
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 45, alignment: .trailing)
                            
                        } // -> HStack
                        
                    } // -> VStack
                    .frame(height: 100)
                    .padding(.top, 30)
                    
                    Line()
                        .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(height: 1)
                    
                    // MARK: EXTRA INFO
                    HStack {
                        
                        VStack {
                            
                            Text("\(tripAux.numberOfTravelers)")
                                .font(.system(size: 15, weight: .heavy))
                            
                            Text("Travelers")
                                .font(.system(size: 10))
                            
                        } // -> VStack
                        
                        Spacer()
                            .frame(width: 100)
                        
                        VStack {
                            
                            Text("\(daysBetween(from: tripAux.startDate, to: tripAux.finalDate)+1)")
                                .font(.system(size: 15, weight: .heavy))
                            
                            Text("Days")
                                .font(.system(size: 10))
                            
                        } // -> VStack
                        
                    } // -> HStack
                    .padding(.vertical, 30)
                    .padding(.bottom, 20)
                    
                } // -> VStack
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(
                    TicketUpper(cornerRadius: 20, cutRadius: 20)
                ) // -> clipShape
                
                // MARK: MIDDLE
                VStack {
                    
                    // MARK: DATA
                    VStack {
                        
                        // MARK: SUBHEADERS FOR TRAVELERS
                        if tripAux.numberOfTravelers > 1 {
                            
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
                            
                            Text(String(format: "€%.2f", tripAux.outboundFlightCost))
                                .font(.system(size: 10, weight: .heavy))
                                .foregroundStyle(Color("AccentColor"))
                            
                            if tripAux.numberOfTravelers > 1 {
                                
                                GeometryReader { geo in
                                    
                                    let availableWidth = geo.size.width
                                    
                                    Text(String(repeating: ".", count: Int(availableWidth/4)))
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color("defaultLightGray"))
                                        .frame(maxWidth: .infinity)
                                    
                                } // -> GeometryReader
                                .frame(height: 20)
                                
                                Text(String(format: "€%.2f", tripAux.outboundFlightCost*Double(tripAux.numberOfTravelers)))
                                    .font(.system(size: 10, weight: .heavy))
                                    .foregroundStyle(Color("AccentColor"))
                                
                            } // -> if
                            
                        } // -> HStack
                        
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
                            
                            Text(String(format: "€%.2f", tripAux.returnFlightCost))
                                .font(.system(size: 10, weight: .heavy))
                                .foregroundStyle(Color("AccentColor"))
                            
                            if tripAux.numberOfTravelers > 1 {
                                
                                GeometryReader { geo in
                                    
                                    let availableWidth = geo.size.width
                                    
                                    Text(String(repeating: ".", count: Int(availableWidth/4)))
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color("defaultLightGray"))
                                        .frame(maxWidth: .infinity)
                                    
                                } // -> GeometryReader
                                .frame(height: 20)
                                
                                Text(String(format: "€%.2f", (tripAux.returnFlightCost)*Double(tripAux.numberOfTravelers)))
                                    .font(.system(size: 10, weight: .heavy))
                                    .foregroundStyle(Color("AccentColor"))
                                
                            } // -> if
                            
                        } // -> HStack
                        
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
                            
                            Text(String(format: "€%.2f", tripAux.outboundFlightCost + tripAux.returnFlightCost))
                                .font(.system(size: 10, weight: .heavy))
                                .foregroundStyle(Color("AccentColor"))
                            
                            if tripAux.numberOfTravelers > 1 {
                                
                                GeometryReader { geo in
                                    
                                    let availableWidth = geo.size.width
                                    
                                    Text(String(repeating: ".", count: Int(availableWidth/4)))
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color("defaultLightGray"))
                                        .frame(maxWidth: .infinity)
                                    
                                } // -> GeometryReader
                                .frame(height: 20)
                                
                                Text(String(format: "€%.2f", (tripAux.outboundFlightCost + tripAux.returnFlightCost)*Double(tripAux.numberOfTravelers)))
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
                            
                        Text("FLIGHTS")
                            .font(.system(size: 20, weight: .heavy))
                        
                        GeometryReader { geo in
                            
                            let availableWidth = geo.size.width
                                
                            Text(String(repeating: ".", count: Int(availableWidth/4)))
                                .font(.system(size: 15))
                                .foregroundStyle(Color("defaultLightGray"))
                                .frame(maxWidth: .infinity)
                            
                        } // -> GeometryReader
                        .frame(height: 12)
                        
                        Text(String(format: "€%.2f", (tripAux.outboundFlightCost + tripAux.returnFlightCost)*Double(tripAux.numberOfTravelers)))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                    } // -> HStack
                    .padding(.vertical, 20)
                    .padding(.bottom, 10)
                    
                } // -> VStack
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(
                    TicketMiddle(cutRadius: 20)
                ) // -> clipShape
                .offset(y: -20)
                
                // MARK: BOTTOM
                VStack {
                    
                    // MARK: RETURN
                    if !trip.isRoundTrip {
                        HStack {
                            
                            Text(tripAux.originCode)
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 45, alignment: .leading)
                            
                            Spacer()
                            
                            Image("flight")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                            Spacer()
                            
                            Text(tripAux.destinyCode)
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
                            
                        Text("FLIGHTS")
                            .font(.system(size: 20, weight: .heavy))
                        
                        GeometryReader { geo in
                            
                            let availableWidth = geo.size.width
                                
                            Text(String(repeating: ".", count: Int(availableWidth/4)))
                                .font(.system(size: 15))
                                .foregroundStyle(Color("defaultLightGray"))
                                .frame(maxWidth: .infinity)
                            
                        } // -> GeometryReader
                        .frame(height: 12)
                        
                        Text(String(format: "€%.2f", totalTripCost(trip: tripAux)))
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundStyle(Color("AccentColor"))
                        
                    } // -> HStack
                    .padding(.vertical, 20)
                    .padding(.bottom, 10)
                    
                } // -> VStack
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(
                    TicketBottom(cornerRadius: 20, cutRadius: 20)
                ) // -> clipShape
                .offset(y: -40)
                
            } // -> VStack
            .padding(.horizontal, 20)
            
        } // -> ZStack
        .onDisappear {
            if selectedTab != 0 {
                navigateToDetail = false
            } // -> if
        } // -> onDisappear
        
    } // -> body
    
} // -> SearchView
