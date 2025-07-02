//
//  ProductResponseDTO.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

// Respuesta principal de la API
struct ProductAPIResponse: Decodable {
    let plpResults: PLPResults
}

// Resultados dentro de la respuesta
struct PLPResults: Decodable {
    let records: [ProductResponseDTO]
}

// Producto individual (DTO)
struct ProductResponseDTO: Decodable {
    let productId: String
    let productDisplayName: String
    let listPrice: Double
    let promoPrice: Double
    let lgImage: String?
    let variantsColor: [ColorVariantDTO]?
}
// Variante de color del producto
struct ColorVariantDTO: Decodable {
    let colorName: String
    let colorHex: String?
}
