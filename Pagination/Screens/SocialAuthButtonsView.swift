//
//  SocialAuthButtonsView.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

// MARK: - Social Auth Buttons Component
struct SocialAuthButtonsView: View {
    var body: some View {
        HStack(spacing: 20) {
            
            // Google Button (Uses custom asset "google")
            AuthButton(iconAssetName: "google", isSystemIcon: false)
            
            // Apple Button (Uses custom asset "apple")
            AuthButton(iconAssetName: "apple", isSystemIcon: false)

            // Email Button (Keeps SF Symbol "envelope.fill")
            AuthButton(iconAssetName: "envelope.fill", isSystemIcon: true)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity)
    }
}
