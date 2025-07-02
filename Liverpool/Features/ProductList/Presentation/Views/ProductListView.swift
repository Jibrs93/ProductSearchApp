//
//  ProductListView.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var viewModel: ProductListViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Barra de búsqueda
                SearchBarView(text: $viewModel.searchTerm) {
                    Task { await viewModel.fetchProducts(reset: true) }
                }

                // Lista de productos
                List {
                    ForEach(viewModel.products) { product in
                        ProductRowView(product: product)
                            .onAppear {
                                if product == viewModel.products.last {
                                    Task { await viewModel.fetchProducts(reset: false) }
                                }
                            }
                    }

                    if viewModel.isLoadingPage {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .emptyState(viewModel.products.isEmpty && !viewModel.isLoadingInitial, message: "No se encontraron productos")
                .loadingPlaceholder(viewModel.isLoadingInitial)
            }
            .navigationTitle("Productos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu("Ordenar") {
                        ForEach(viewModel.sortOptions, id: \.self) { option in
                            Button(option.label) {
                                Task {
                                    viewModel.selectedSort = option
                                    await viewModel.fetchProducts(reset: true)
                                }
                            }
                        }
                    }
                    .tint(Color.mainColorLiverpool)
                }
            }
            .overlay {
                if viewModel.isLoadingInitial {
                    VStack {
                        Spacer()
                        ProgressView("Cargando productos...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.2))
                }
            }
        }
    }
}
