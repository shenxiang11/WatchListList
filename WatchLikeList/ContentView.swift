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
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(exampleData, id: \.self) { color in
                            RowView(color: color)
                        }
                    }
                    .padding(PADDING)
                }
                .coordinateSpace(.named("List"))
            }
            .navigationTitle("列表")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
