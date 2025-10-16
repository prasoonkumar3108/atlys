//
//  Destination.swift
//  Pagination
//
//  Created by Prasoon Tiwari on 16/10/25.
//

import SwiftUI

// MARK: - Data Model for Carousel
struct Destination: Identifiable {
    let id = UUID()
    let city: String
    // Image names correspond to assets (dubai.jpg, malaysia.jpg, thailand.jpg)
    let imageName: String
    let stats: String
    let isVerified: Bool
}
