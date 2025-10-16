//
//  VisaCardView.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

// MARK: -  Card Component
struct VisaCardView: View {
    let destination: Destination
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            // MARK: Full Image Background
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .clipped()
            
            // MARK: Gradient Banner for Text Contrast
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                startPoint: .center,
                endPoint: .bottom
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack(alignment: .leading, spacing: 5) {
                // MARK: City Name
                Text(destination.city)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // MARK: Stats Badge
                Text(destination.stats)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.indigo.opacity(0.8))
                    .cornerRadius(8)
            }
            .padding(20)
            
            // MARK: Verification Checkmark (Top Right)
            if destination.isVerified {
                Circle()
                    .fill(Color.white)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.blue)
                    )
                    .padding(15)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
            
        }
        .background(Color.white)
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}
