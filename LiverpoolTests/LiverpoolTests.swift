//
//  LiverpoolTests.swift
//  LiverpoolTests
//
//  Created by Jonathan Lopez on 02/07/25.
//

import XCTest
@testable import Liverpool

final class ProductListViewModelTests: XCTestCase {

    // Mock del repositorio
    class MockProductRepository: ProductRepositoryProtocol {
        let products: [Product]
        
        init(products: [Product]) {
            self.products = products
        }
        
        func fetchProducts(search: String, sort: String?, page: Int) async throws -> [Product] {
            return products
        }
    }
    
    func test_fetchProducts_returnsProducts() async throws {
        // Arrange
        let mockProduct = Product(
            id: "1",
            productDisplayName: "Zapato deportivo",
            listPrice: 1499.0,
            promoPrice: 999.0,
            lgImage: nil,
            colorVariants: []
        )
        
        let mockRepo = MockProductRepository(products: [mockProduct])
        let useCase = FetchProductsUseCase(repository: mockRepo)
        let viewModel = await ProductListViewModel(useCase: useCase)
        
        // Act
        await viewModel.fetchProducts(reset: true)
        
        // Assert
        
        let count = await MainActor.run { viewModel.products.count }
        XCTAssertEqual(count, 1)
        
        let firstName = await MainActor.run { viewModel.products.first?.productDisplayName }
        XCTAssertEqual(firstName, "Zapato deportivo")
    }

    func test_fetchProducts_emptyList() async throws {
        let mockRepo = MockProductRepository(products: [])
        let useCase = FetchProductsUseCase(repository: mockRepo)
        let viewModel = await ProductListViewModel(useCase: useCase)
        
        await viewModel.fetchProducts(reset: true)
        
        let isEmpty = await MainActor.run { viewModel.products.isEmpty }
        XCTAssertTrue(isEmpty)
    }
    
}
