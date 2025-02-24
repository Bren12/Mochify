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
    
    @Binding var navigateToDetail: Bool
    
    @State private var expanded: Bool = false
    
    @State var selectedDetail: Int = 0
    @State var modeCarousel: Bool = false
    
    @State var trip: TripCostModel
    
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
                                    .opacity(selectedDetail > 0 ? 1 : 0.5)
                            } // -> Button
                            .disabled(selectedDetail > 0 ? false : true)
                            
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
                                    .opacity(selectedDetail < 3 ? 1 : 0.5)
                            } // -> Button
                            .disabled(selectedDetail < 3 ? false : true)
                            
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
                
                // MARK: BUTTON CAROUSEL
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
                
                // MARK: WARNING TEXT
                VStack {
                    Text(warningText)
                        .font(.system(size: 15))
                        .foregroundStyle(Color("defaultGray"))
                        .lineLimit(expanded ? nil : 1)
                    HStack{
                        Spacer()
                        Button(action: {
                            expanded.toggle()
                        }, label: {
                            Text(expanded ? "...read less" : "...read more")
                                .font(.system(size: 15))
                                .foregroundStyle(Color("AccentColor"))
                        }) // -> Button
                    } // -> HStack
                } // -> VStack
                .padding(.horizontal, 33)
                .padding(.bottom, modeCarousel ? -60 : 20)
                .offset(y: modeCarousel ? -80 : 0)
                
            } // -> ScrollView
            .scrollIndicators(.hidden)
            
        } // -> ZStack
        // MARK: DELET BUTTON
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
            navigateToDetail = false
        } // -> onDisappear
        
    } // -> body
    
    // MARK: DELETE FUNCTION
    func deleteTrip(trip: TripCostModel) {
        context.delete(trip)
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error)")
        } // -> do-catch
    } // -> deleteTrip
    
} // -> SearchView
