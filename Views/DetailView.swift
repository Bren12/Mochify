//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [TripCostModel]
    
    @Binding var selectedTab: Int
    @Binding var navigateToDetail: Bool
    
    @State var trip: TripCostModel
    
    var body: some View {
        
        VStack {
            Text(trip.destinyCode)
        }
        .onDisappear {
            if selectedTab != 0 {
                navigateToDetail = false
            }
        }
        
    } // -> body
    
} // -> SearchView
