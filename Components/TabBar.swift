//
//  TabBar.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectedTab = 0
    
    @State var selectedCity = ""
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                } // -> tabItem
            
            SearchCity(selectedCity: $selectedCity)
                .tabItem {
                    Label("Trips", systemImage: "suitcase.fill")
                } // -> tabItem
            
        } // -> TabView
        
    } // -> body
    
} // -> TabBarView

#Preview {
    TabBar()
} // -> Preview
