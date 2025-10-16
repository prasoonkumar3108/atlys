//
//  CarouselView.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

// MARK: - Carousel Component
struct CarouselView: View {
    let destinations: [Destination]
    @Binding var currentCardIndex: Int
    
    // Define the card width to be slightly smaller than the screen to show neighbors
    let cardWidthRatio: CGFloat = 0.85
    let cardSpacing: CGFloat = -40 // Negative spacing for overlap
    
    var body: some View {
        VStack {
            GeometryReader { fullGeometry in
                let cardWidth = fullGeometry.size.width * cardWidthRatio
                let padding = (fullGeometry.size.width - cardWidth) / 2
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: cardSpacing) {
                            
                            ForEach(destinations.indices, id: \.self) { index in
                                
                                GeometryReader { itemGeometry in
                                    VisaCardView(destination: destinations[index])
                                        .frame(width: cardWidth)
                                        .scaleEffect(getScale(proxy: itemGeometry, fullWidth: fullGeometry.size.width))
                                        .id(index)
                                        .onTapGesture {
                                            withAnimation {
                                                currentCardIndex = index
                                                proxy.scrollTo(index, anchor: .center)
                                            }
                                        }
                                }
                                .frame(width: cardWidth)
                                .zIndex(Double(index == currentCardIndex ? 1 : 0))
                            }
                        }
                        .padding(.horizontal, padding)
                        
                    }
                    .onAppear {
                        proxy.scrollTo(currentCardIndex, anchor: .center)
                    }
                    .onChange(of: currentCardIndex) { newIndex in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            proxy.scrollTo(newIndex, anchor: .center)
                        }
                    }
                }
            }
            
            // Custom Page Indicators
            HStack(spacing: 8) {
                ForEach(destinations.indices, id: \.self) { index in
                    Circle()
                        .fill(index == currentCardIndex ? Color.black : Color.gray.opacity(0.4))
                        .frame(width: 6, height: 6)
                }
            }
            .padding(.top, 10)
        }
    }
    
    // Helper function to calculate the scale effect based on position
    private func getScale(proxy: GeometryProxy, fullWidth: CGFloat) -> CGFloat {
        let minScale: CGFloat = 0.85
        let cardCenter = proxy.frame(in: .global).midX
        let screenCenter = fullWidth / 2
        let distance = abs(cardCenter - screenCenter)
        let normalizedDistance = min(1.0, distance / (fullWidth / 2))
        let scale = 1.0 - (normalizedDistance * (1.0 - minScale))
        return scale
    }
}
