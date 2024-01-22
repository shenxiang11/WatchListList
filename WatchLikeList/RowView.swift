//
//  RowView.swift
//  WatchLikeList
//
//  Created by FS on 2024/1/22.
//

import SwiftUI

struct RowView: View {
    var color: UIColor = .blue
    
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(color))
            .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    RowView()
}
