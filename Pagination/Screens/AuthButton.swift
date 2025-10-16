//
//  AuthButton.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

//MARK: -  Helper for Auth Buttons
struct AuthButton: View {
    let iconAssetName: String
    let isSystemIcon: Bool
    
    var body: some View {
        Button(action: { print("\(iconAssetName) tapped") }) {
            Group {
                if isSystemIcon {
                    Image(systemName: iconAssetName)
                        .font(.title2)
                        .foregroundColor(.black)
                } else {
                    // Use custom asset (e.g., "google")
                    Image(iconAssetName)
                        .resizable()
                        .scaledToFit()
                        // Increased size of logo images slightly
                        .frame(width: 30, height: 30)
                }
            }
            .frame(width: 50, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}
