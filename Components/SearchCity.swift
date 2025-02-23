//
//  SearchCity.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 21/02/25.
//


import SwiftUI

struct SearchCity: View {
    
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var isSearchFocused: Bool
    
    @Binding var selectedCity: String
    
    @State private var cities: [City] = City.sampleCities
    @State private var searchText = ""
    
    @State var placeholder: String = ""
    @State var removeCity: String? = nil
    
    var filteredCities: [City] {
        guard !searchText.isEmpty else { return cities }
        return cities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color("background")
                
                VStack {
                    
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField(placeholder, text: $searchText)
                            .foregroundColor(.black)
                            .focused($isSearchFocused)
                            .onAppear { isSearchFocused = true }
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            } // -> Button
                        } // -> if
                        
                    } // -> HStack
                    .padding(10)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top)
                    .padding(.horizontal, 20)
                        
                    List(filteredCities, id: \.id) { city in
                        if removeCity == nil || removeCity != city.name {
                            Button(action: {
                                selectedCity = city.name
                                dismiss()
                            }) {
                                HStack {
                                    Text(city.name)
                                    
                                    Spacer()
                                    
                                    Text(city.country)
                                        .foregroundStyle(Color("defaultGray"))
                                } // -> HStack
                                
                            } // -> Button
                        } // -> if
                    } // -> List
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.hidden)
                    
                } // -> VStack
                
            } // -> ZStack
            
        } // -> NavigationStack
        
    } // -> body
    
} // -> FlightSearchView
