//
//  File.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import SwiftUI

struct SegmentedPicker: View {
    
    @Binding private var selection: String
    private let items: [String]
    
    init(items: [String], selection: Binding<String>) {
        self._selection = selection
        self.items = items
    }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .frame(height: 60)
            
            HStack(spacing: 0) {
                    
                ForEach(items, id: \.self) { item in
                    
                    Button {
                        selection = item
                    } label: {
                        Text(item)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(item == selection ? Color("AccentColor") : Color.clear)
                            ) // -> background
                            .foregroundColor(item == selection ? .white : .gray)
                    } // -> Button
                    
                } // -> ForEach
                
            } // ->HStack
            .padding(.horizontal, 25)
            
        } // -> ZStack
        
    } // -> body
    
} // -> SegmentedPicker
