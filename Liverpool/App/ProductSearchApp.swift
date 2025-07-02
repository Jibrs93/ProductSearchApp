//
//  ContentView.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

struct ProductSearchApp: App {
    
    @StateObject private var viewModel = ProductListViewModel(
        useCase: FetchProductsUseCase(
            repository: ProductRepository(
                service: ProductAPIService()
            )
        )
    )

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environmentObject(viewModel) // Inyectamos el ViewModel a nivel global si se necesita
        }
    }
}
