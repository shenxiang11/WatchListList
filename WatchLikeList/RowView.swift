//
//  RowView.swift
//  WatchLikeList
//
//  Created by FS on 2024/1/22.
//

import SwiftUI

struct RowView: View {
    @State var y: CGFloat = 0
    var color: UIColor = .blue
    
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(color))
            .clipShape(.rect(cornerRadius: 25))
            .frame(height: 140)
            .scaleEffect(calc(y2: y), anchor: .bottom)
            .opacity(calc(y2: y))
            .offsetExtractor(coordinateSpace: "List") { value in
                y = value.minY
            }
    }
    
    func calc(y2: CGFloat) -> CGFloat {
        let k: CGFloat = 100
        let result = (y2 + k - PADDING) / k
        
        if (result > 1) {
            return 1
        } else if (result < 0) {
            return 0
        } else {
            return result
        }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    func offsetExtractor(coordinateSpace: String, completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .named(coordinateSpace))
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self) {
                            completion($0)
                        }
                }
            }
    }
}


#Preview {
    RowView()
}
