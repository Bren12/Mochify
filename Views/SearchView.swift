//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [TripCostModel]
    
    @Binding var selectedTab: Int
    @Binding var navigateToDetail: Bool
    @Binding var tripPosted: TripCostModel
    
    @State var isRoundTrip: Bool = true
    @State var startDate = Date()
    @State var finalDate = Date()
    @State var numberOfTravelers: String = "1"
    
    @State private var origin: City = dummyCity
    @State private var destiny: City = dummyCity
    
    let modeTrip: [String] = ["Round Trip", "One Way"]
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // MARK: BACKGROUND
                Color("background")
                
                // MARK: HEADER BOX
                ZStack {
                    VStack {
                        Rectangle()
                            .frame(height: 245)
                            .foregroundStyle(Color("AccentColor"))
                        Spacer()
                    } // -> VStack
                } // -> ZStack
                
                VStack(spacing: 0) {
                    
                    // MARK: ICON
                    Image("luggage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 85)
                        .padding()
                    
                    // MARK: TITLE
                    HStack {
                        Text("Budget your trip!")
                            .font(.system(size: 40, weight: .heavy))
                            .bold()
                            .foregroundStyle(.white)
                        Spacer()
                    } // -> HStack
                    .padding(.horizontal)
                    
                    // MARK: FORM
                    ZStack {
                        
                        // MARK: BOX
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white)
                                .frame(height: 513)
                                .padding()
                            Spacer()
                        } // -> VStack
                        
                        VStack {
                            
                            // MARK: TOGGLE BUTTON
                            HStack {
                                
                                ForEach(modeTrip, id: \.self) { mode in
                                    
                                    Button {
                                        if (!isRoundTrip && mode == modeTrip[0]) || (isRoundTrip && mode == modeTrip[1]) {
                                            isRoundTrip.toggle()
                                        }
                                    } label: {
                                        
                                        if (isRoundTrip && mode == modeTrip[0]) || (!isRoundTrip && mode == modeTrip[1]) {
                                            
                                            ZStack {
                                                
                                                Circle()
                                                    .stroke(Color("AccentColor"), lineWidth: 1)
                                                    .frame(height: 30)
                                                
                                                Circle()
                                                    .foregroundStyle(Color("AccentColor"))
                                                    .frame(height: 20)
                                                
                                            } // -> ZStack
                                            
                                        } else {
                                            Circle()
                                                .stroke(Color("AccentColor"), lineWidth: 1)
                                                .frame(height: 30)
                                        } // -> if-else
                                        
                                    } // -> Button
                                    
                                    Text(mode)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black)
                                    
                                    if mode == modeTrip[0] {
                                        Spacer()
                                            .frame(width: 50)
                                    }
                                    
                                } // -> ForEach
                                
                                Spacer()
                                
                            } // -> HStack
                            .frame(height: 65)
                            .padding(.top, 25)
                            
                            Divider()
                            
                            // MARK: ORIGIN CITY
                            HStack {
                                
                                Image(systemName: "airplane.departure")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color("defaultLightGray"))
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("From")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                        .frame(height: 1)
                                    
                                    NavigationLink(destination: SearchCity(selectedCity: $origin, placeholder: "Origin")) {
                                        Text(origin.name.isEmpty ? "Origin" : origin.name)
                                            .font(.system(size: 20))
                                            .foregroundStyle(origin.name.isEmpty ? Color("defaultGray") : .black)
                                    }
                                    
                                } // -> VStack
                                
                                Spacer()
                                
                            } // -> HStack
                            .frame(height: 65)
                            
                            Line()
                                .stroke(Color("defaultLightGray"), style: StrokeStyle(lineWidth: 1, dash: [10]))
                                .frame(height: 1)
                            
                            // MARK: SWITCH CITIES BUTTON
                                .overlay {
                                    Button {
                                        let aux = origin
                                        origin = destiny
                                        destiny = aux
                                    } label: {
                                        
                                        HStack {
                                            
                                            Spacer()
                                            
                                            ZStack {
                                                
                                                RoundedRectangle(cornerRadius: 8)
                                                    .frame(width: 40, height: 40)
                                                    .foregroundStyle(Color("AccentColor"))
                                                
                                                VStack {
                                                    Image(systemName: "arrow.up.arrow.down")
                                                        .font(.system(size: 20, weight: .heavy))
                                                        .foregroundStyle(.white)
                                                } // -> VStack
                                                
                                            } // -> ZStack
                                            
                                            Spacer()
                                                .frame(width: 20)
                                            
                                        } // -> HStack
                                        
                                    } // -> Button
                                    
                                } // -> overlay
                            
                            // MARK: DESTINY CITY
                            HStack {
                                
                                Image(systemName: "airplane.arrival")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color("defaultLightGray"))
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("To")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                        .frame(height: 1)
                                    
                                    NavigationLink(destination: SearchCity(selectedCity: $destiny, placeholder: "Destiny", removeCity: origin)) {
                                        Text(destiny.name.isEmpty || origin == destiny ? "Destiny" : destiny.name)
                                            .font(.system(size: 20))
                                            .foregroundStyle(destiny.name.isEmpty || origin == destiny ? Color("defaultGray") : .black)
                                    } // -> NavigationLink
                                    
                                } // -> VStack
                                
                                Spacer()
                                
                            } // -> HStack
                            .frame(height: 65)
                            
                            Divider()
                            
                            // MARK: TRIP DATE
                            
                            HStack {
                                
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color("defaultLightGray"))
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Start date")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                        .frame(height: 1)
                                    
                                    DatePicker(
                                        "",
                                        selection: $startDate,
                                        in: Date()...,
                                        displayedComponents: [.date]
                                    )
                                    .labelsHidden()
                                    
                                } // -> VStack
                                .frame(width: 120)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Final date")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                        .frame(height: 1)
                                    
                                    DatePicker(
                                        "",
                                        selection: $finalDate,
                                        in: Date()...,
                                        displayedComponents: [.date]
                                    )
                                    .labelsHidden()
                                    
                                } // -> VStack
                                .frame(width: 120)
                                
                                Spacer()
                                
                            } // -> HStack
                            .frame(height: 65)
                            
                            Divider()
                            
                            // MARK: TRAVELERS
                            HStack {
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color("defaultLightGray"))
                                
                                Spacer()
                                    .frame(width: 20)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Travelers")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                        .frame(height: 1)
                                    
                                    TextField("Number of travelers", text: $numberOfTravelers)
                                        .font(.system(size: 20))
                                        .foregroundStyle(.black)
                                        .keyboardType(.numberPad)
                                        .onChange(of: numberOfTravelers) { _ in
                                            numberOfTravelers = numberOfTravelers.filter { $0.isNumber }
                                                .replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
                                        } // -> onChange
                                    
                                } // -> VStack
                                
                            } // -> HStack
                            .frame(height: 65)
                            
                            Divider()
                            
                            // MARK: BUTTON
                            Button {
                                addTrip(isModeRoundTrip: isRoundTrip, origin: origin, destiny: destiny, dateStart: startDate, dateEnd: finalDate, numberTravelers: numberOfTravelers)
                                navigateToDetail = true
                                selectedTab = 1
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(height: 60)
                                    
                                    Text("Calculate")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 25, weight: .heavy))
                                    
                                } // -> ZStack
                                
                            } // -> Button
                            .frame(height: 90)
                            
                            Spacer()
                            
                        } // -> VStack
                        .padding(.horizontal, 40)
                        
                    } // -> ZStack
                    
                } // -> VStack
                
            } // -> ZStack
            
        } // -> NavigationStack
        
    } // -> body
    
    func addTrip(isModeRoundTrip: Bool, origin: City, destiny: City, dateStart: Date, dateEnd: Date, numberTravelers: String) {
        let outboundCost: Double = adjustedFlightCost(from: origin.code, to: destiny.code, flightDate: dateStart)
        let returnCost: Double = isModeRoundTrip ? adjustedFlightCost(from: destiny.code, to: origin.code, flightDate: finalDate) : 0
        let newTrip = TripCostModel(originCode: origin.code, destinyCode: destiny.code, outboundFlightCost: outboundCost, returnFlightCost: returnCost, startDate: dateStart, finalDate: dateEnd, numberOfTravelers: Int(numberTravelers) ?? 1)
        context.insert(newTrip)
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
        tripPosted = newTrip
    } // -> addTrip
    
} // -> SearchView
