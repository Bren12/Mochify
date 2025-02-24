//
//  SummaryView.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import SwiftUI
import SwiftData

struct SummaryView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [TripCostModel]
    
    @Binding var navigateToDetail: Bool
    @Binding var selectedTab: Int
    @Binding var tripPosted: TripCostModel
    
    @State var isUpcoming: String = "UPCOMING"
    @State var showDetail: Bool = false
    
    let timeEvent: [String] = ["UPCOMING", "PAST TRIPS"]
    
    var filteredTrips: [TripCostModel] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let filtered: [TripCostModel]
        if isUpcoming == "UPCOMING" {
            filtered = trips.filter {
                let tripEnd = calendar.startOfDay(for: $0.finalDate)
                return tripEnd >= today
            } // -> filtered
        } else {
            filtered = trips.filter {
                let tripEnd = calendar.startOfDay(for: $0.finalDate)
                return tripEnd < today
            } // -> filtered
        } // -> if-else
        return filtered.sorted { calendar.startOfDay(for: $0.startDate) < calendar.startOfDay(for: $1.startDate) }
    } // -> filteredTrips
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("background")
                
                VStack {
                    
                    SegmentedPicker(items: timeEvent, selection: $isUpcoming)
                        .padding(.vertical)
                    
                    if filteredTrips.isEmpty {
                        Spacer()
                        Image("backpackBg")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color("defaultGray"))
                            .frame(width: 120, height: 120)
                        if isUpcoming == timeEvent[0] {
                            Text("Start planning a new trip!")
                                .foregroundStyle(Color("defaultGray"))
                                .font(.system(size: 20, weight: .heavy))
                        } else {
                            Text("There are no trips to show!")
                                .foregroundStyle(Color("defaultGray"))
                                .font(.system(size: 20, weight: .heavy))
                        } // -> if-else
                        Spacer()
                        Spacer()
                    } else {
                        
                        ScrollView {
                            
                            ForEach(filteredTrips) { trip in
                                
                                NavigationLink(
                                    destination: DetailView(selectedTab: $selectedTab, navigateToDetail: $navigateToDetail, trip: trip)
                                ) {
                                    CardSummary(trip: trip)
                                        .padding(.bottom)
                                } // -> NavigationLink
                                
                            } // -> ForEach
                            
                        } // -> ScrollView
                        
                    } // -> if-else
                    
                } // -> VStack
                
            } // -> ZStack
            
            NavigationLink(
                destination: DetailView(selectedTab: $selectedTab, navigateToDetail: $navigateToDetail, trip: tripPosted),
                isActive: $showDetail,
                label: { EmptyView() }
            ) // -> NavigationLink
            
        } // -> NavigationStack
        .onAppear {
            showDetail = navigateToDetail
        }
        
    } // -> body
    
} // -> SummaryView
