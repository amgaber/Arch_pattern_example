//
//  NetworkService.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 22/11/2024.
//

import Foundation

struct NetworkService {

    func fetchService(_ endpoint: Endpoint) async throws -> Data {
        guard let url = endpoint.url else {
            throw URLError(.badURL)
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    func fetchService(_ url: URL) async throws -> Data {
        
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
