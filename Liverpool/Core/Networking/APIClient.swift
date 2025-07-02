//
//  Networking.swift
//  Liverpool
//
//  Created by Jonathan Lopez on 02/07/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError
    case unknown(Error)
}

protocol APIClientProtocol {
    func request<T: Decodable>(
        endpoint: URLRequest,
        responseModel: T.Type
    ) async throws -> T
}

final class APIClient: APIClientProtocol {
    
    func request<T: Decodable>(
        endpoint: URLRequest,
        responseModel: T.Type
    ) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(for: endpoint)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                throw APIError.statusCode(httpResponse.statusCode)
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw APIError.decodingError
            }
            
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.unknown(error)
        }
    }
}
