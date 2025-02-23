//
//  TabBar.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectedTab: Int = 0
    @State private var navigateToDetail: Bool = false
    @State private var tripPosted: TripCostModel = TripCostModel(originCode: "", destinyCode: "", outboundFlightCost: 0, returnFlightCost: 0, startDate: Date(), finalDate: Date(), numberOfTravelers: 0)
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            DetailView(selectedTab: $selectedTab, navigateToDetail: $navigateToDetail, trip: tripPosted)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                } // -> tabItem
                .tag(0)
            
            DetailView(selectedTab: $selectedTab, navigateToDetail: $navigateToDetail, trip: tripPosted)
                .tabItem {
                    Label("Trips", systemImage: "suitcase.fill")
                } // -> tabItem
                .tag(1)
            
        } // -> TabView
        
    } // -> body
    
} // -> TabBarView

#Preview {
    TabBar()
} // -> Preview
