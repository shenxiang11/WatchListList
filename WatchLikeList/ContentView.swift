//
//  ContentView.swift
//  WatchLikeList
//
//  Created by FS on 2024/1/22.
//

import SwiftUI

let exampleData: [UIColor] = [
    .red,
    .orange,
    .yellow,
    .green,
    .cyan,
    .blue,
    .purple,
    .brown,
]

let PADDING: CGFloat = 20

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { mainView in
                    let my = mainView.frame(in: .global).minY
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(exampleData, id: \.self) { color in
                                GeometryReader { itemView in
                                    let iy = itemView.frame(in: .named("List")).minY
                                    
                                    RowView(color: color)
                                        .scaleEffect(calc(y1: my, y2: iy), anchor: .bottom)
                                        .opacity(calc(y1: my, y2: iy))
                                }
                                .frame(height: 140)
                            }
                        }
                        .padding(PADDING)
                    }
                }
            }
            .coordinateSpace(.named("List"))
            .navigationTitle("列表")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func calc(y1: CGFloat, y2: CGFloat) -> CGFloat {
        var result = (y2 + y1 - PADDING) / y1
        
        if (result > 1) {
            return 1
        } else if (result < 0) {
            return 0
        } else {
            return result
        }
    }
}

#Preview {
    ContentView()
}
