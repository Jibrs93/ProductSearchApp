//
//  ProductListAssembly.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

struct ProductListAssembly {
    @MainActor static func makeViewModel() -> ProductListViewModel {
        let service = ProductAPIService()
        let repository = ProductRepository(service: service)
        let useCase = FetchProductsUseCase(repository: repository)
        let viewModel = ProductListViewModel(useCase: useCase)
        return viewModel
    }
}
