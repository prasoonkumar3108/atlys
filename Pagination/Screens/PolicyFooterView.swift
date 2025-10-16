//
//  PolicyFooterView.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

// MARK: - Policy Footer Component
struct PolicyFooterView: View {
    var body: some View {
        Text("By continuing, you agree to our ")
            .font(.caption)
        + Text("terms")
            .font(.caption)
            .fontWeight(.bold)
            .underline()
        + Text(" & ")
            .font(.caption)
        + Text("privacy policy.")
            .font(.caption)
            .fontWeight(.bold)
            .underline()
    }
}
