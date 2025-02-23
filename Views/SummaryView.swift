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
        if isUpcoming == "UPCOMING" {
            return trips.filter {
                let tripEnd = calendar.startOfDay(for: $0.finalDate)
                return tripEnd >= today
            }
        } else {
            return trips.filter {
                let tripEnd = calendar.startOfDay(for: $0.finalDate)
                return tripEnd < today
            }
        }
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
