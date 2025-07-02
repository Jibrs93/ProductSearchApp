//
//  ProductRepository.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

final class ProductRepository: ProductRepositoryProtocol {
    private let service: ProductAPIServiceProtocol

    init(service: ProductAPIServiceProtocol) {
        self.service = service
    }

    func fetchProducts(search: String, sort: String?, page: Int) async throws -> [Product] {
        let dtoList = try await service.fetchProducts(search: search, sort: sort, page: page)
        return dtoList.map { dto in
            Product(
                id: dto.productId,
                productDisplayName: dto.productDisplayName,
                listPrice: Double(dto.listPrice) ?? nil,
                promoPrice: Double(dto.promoPrice) ?? nil,
                lgImage: dto.lgImage,
                colorVariants: dto.variantsColor?.compactMap { variant in
                    Product.ColorVariant(
                        colorName: variant.colorName,
                        colorHex: variant.colorHex
                    )
                }
            )
        }
    }
}
