//
//  ProductRepositoryProtocol.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchProducts(
        search: String,
        sort: String?,
        page: Int
    ) async throws -> [Product]
}
