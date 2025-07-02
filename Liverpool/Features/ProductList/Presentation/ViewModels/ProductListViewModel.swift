//
//  ProductListViewModel.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation
import SwiftUI

@MainActor
final class ProductListViewModel: ObservableObject {
    
    // Estado publicado para la UI
    @Published var products: [Product] = []
    @Published var searchTerm: String = ""
    @Published var isLoadingInitial: Bool = false
    @Published var isLoadingPage: Bool = false
    @Published var selectedSort: SortOption? = nil

    // Paginación
    private var currentPage = 1
    private var canLoadMore = true
    
    // Casos de uso
    private let fetchProductsUseCase: FetchProductsUseCase

    // Ordenamientos disponibles
    let sortOptions: [SortOption] = [
        SortOption(label: "Relevancia", value: "relevance"),
        SortOption(label: "Más barato", value: "lowestPrice"),
        SortOption(label: "Más caro", value: "highestPrice"),
        SortOption(label: "Más nuevo", value: "newest"),
        SortOption(label: "Mejor calificados", value: "ratings")
    ]
    
    init(useCase: FetchProductsUseCase) {
        self.fetchProductsUseCase = useCase
        Task {
            await fetchProducts(reset: true)
        }
    }

    // MARK: - Función principal de carga
    func fetchProducts(reset: Bool) async {
        guard !isLoadingInitial && !isLoadingPage else { return }

        if reset {
            currentPage = 1
            canLoadMore = true
            isLoadingInitial = true
            print("Cargando productos iniciales...") // Helper
        } else {
            guard canLoadMore else { return }
            isLoadingPage = true
        }

        do {
            let newProducts = try await fetchProductsUseCase.execute(
                search: searchTerm,
                sort: selectedSort?.value,
                page: currentPage
            )
            
            if reset {
                products = newProducts
            } else {
                products += newProducts
            }

            canLoadMore = !newProducts.isEmpty
            currentPage += 1
        } catch {
            print("Error al cargar productos: \(error)") // Helper
        }

        isLoadingInitial = false
        isLoadingPage = false
    }
}
