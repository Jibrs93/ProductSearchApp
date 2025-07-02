//
//  ProductAPIService.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

protocol ProductAPIServiceProtocol {
    func fetchProducts(
        search: String,
        sort: String?, // clasificado
        page: Int
    ) async throws -> [ProductResponseDTO]
}

import Foundation

final class ProductAPIService: ProductAPIServiceProtocol {
    func fetchProducts(
        search: String,
        sort: String?,
        page: Int
    ) async throws -> [ProductResponseDTO] {
        
        // Construcción de la URL
        var urlString = """
        https://shoppapp.liverpool.com.mx/appclienteservices/services/v8/plp/sf?page-number=\(page)&search-string=\(search)&force-plp=false&number-of-items-per-page=40&cleanProductName=false
        """

        if let sort = sort {
            urlString += "&sort-option=\(sort)"
        }

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(ProductAPIResponse.self, from: data)
        return decoded.plpResults.records
    }
}
