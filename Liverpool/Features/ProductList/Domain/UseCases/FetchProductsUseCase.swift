//
//  FetchProductsUseCase.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

struct FetchProductsUseCase {
    private let repository: ProductRepositoryProtocol

    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }

    func execute(
        search: String,
        sort: String? = nil,
        page: Int
    ) async throws -> [Product] {
        return try await repository.fetchProducts(search: search, sort: sort, page: page)
    }
}
