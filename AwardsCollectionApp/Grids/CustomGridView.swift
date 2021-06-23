//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 21.06.2021.
//

import SwiftUI

struct CustomGridView<Content: View, T>: View {

    let items: [T]
    let columns: Int
    let content: (T, CGFloat) -> Content
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let itemSize = geometry.size.width / CGFloat(columns)
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], itemSize)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [1,2,3,4,5,6,7], columns: 2) { item, itemSize in
            Text("\(item)")
        }
    }
}
