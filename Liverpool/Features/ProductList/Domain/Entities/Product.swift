//
//  Product.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id: String
    let productDisplayName: String?
    let listPrice: Double?
    let promoPrice: Double?
    let lgImage: String?
    let colorVariants: [ColorVariant]?
    
    struct ColorVariant: Equatable {
        let colorName: String?
        let colorHex: String?
    }
}

struct SortOption: Hashable {
    let label: String
    let value: String
}
