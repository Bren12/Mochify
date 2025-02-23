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
    
    let timeEvent: [String] = ["UPCOMING", "PAST EVENTS"]
    
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
