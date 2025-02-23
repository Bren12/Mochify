//
//  File.swift
//  Mochify
//
//  Created by Brenda Elena Saucedo Gonzalez on 22/02/25.
//

import SwiftUI

struct SegmentedPicker<SelectionValue, Content>: View
       where SelectionValue: Hashable, Content: View {
    // 1.
    @Binding var selection: SelectionValue?

    // 2.
    @Binding var items: [SelectionValue]

    // 3.
    private var selectionColor: Color = .blue

    // 4.
    private var content: (SelectionValue) -> Content

    // TODO: init()
}
