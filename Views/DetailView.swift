//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 20/02/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [TripCostModel]
    
    @Binding var selectedTab: Int
    @Binding var navigateToDetail: Bool
    
    @State var selectedDetail: Int = 0
    
    @State var trip: TripCostModel
    
    @State var modeCarousel: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("background")
                
            ScrollView {
                
                VStack(spacing: 0) {
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: TOP
                    summaryDetail(trip: trip)
                        .padding(.horizontal, 33)
                    
                    if !modeCarousel {
                        
                        HStack {
                            
                            Button {
                                selectedDetail = (selectedDetail > 0) ? selectedDetail - 1 : selectedDetail
                            } label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .foregroundStyle(Color("AccentColor"))
                            } // -> Button
                            
                            VStack {
                                // MARK: MIDDLE
                                TabView(selection: $selectedDetail) {
                                    flightDetail(trip: trip)
                                        .tag(0)
                                    hotelDetail(trip: trip)
                                        .tag(1)
                                    transportDetail(trip: trip)
                                        .tag(2)
                                    mealDetail(trip: trip)
                                        .tag(3)
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .frame(height: 200)
                            } // -> VStack
                            
                            Button {
                                selectedDetail = (selectedDetail < 3) ? selectedDetail + 1 : selectedDetail
                            } label: {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .foregroundStyle(Color("AccentColor"))
                            } // -> Button
                            
                        } // -> HStack
                        .padding(.horizontal, 10)
                        .offset(y: -19)
                        
                    } else {
                        
                        VStack {
                            flightDetail(trip: trip)
                                .offset(y: -19)
                            hotelDetail(trip: trip)
                                .offset(y: -46)
                            transportDetail(trip: trip)
                                .offset(y: -73)
                            mealDetail(trip: trip)
                                .offset(y: -100)
                        } // -> VStack
                        .padding(.horizontal, 33)
                        
                    } // -> if-else
                    
                    // MARK: BOTTOM
                    finalDetail(trip: trip)
                        .padding(.horizontal, 33)
                        .offset(y: modeCarousel ? -119 : -38)
                    
                } // -> VStack
                
                Button {
                    modeCarousel.toggle()
                } label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 60)
                        
                        Text(modeCarousel ? "Collapse All" : "Expand All")
                            .foregroundStyle(.white)
                            .font(.system(size: 25, weight: .heavy))
                        
                    } // -> ZStack
                } // -> Button
                .padding(.horizontal, 33)
                .offset(y: modeCarousel ? -100 : -20)
                
            } // -> ScrollView
            .scrollIndicators(.hidden)
            
        } // -> ZStack
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    deleteTrip(trip: trip)
                    dismiss()
                }) {
                    Text("Delete")
                        .foregroundStyle(.red)
                }
            }
        }
        .onDisappear {
            if selectedTab != 0 {
                navigateToDetail = false
            } // -> if
        } // -> onDisappear
        
    } // -> body
    
    func deleteTrip(trip: TripCostModel) {
        context.delete(trip)
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> deleteTrip
    
} // -> SearchView
