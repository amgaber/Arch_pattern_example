//
//  CharactersFetchService.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import Foundation

struct CharactersFetchService {

    var characters: [Item] = []
    var error: Error?

    private let networkService = NetworkService()
    
    func fetchTasksWithPaging (from url: URL, completion: @escaping (Result<ResultResponse, Error>) async throws-> Void) {
           // Perform the fetch operation in an async context
           Task {
               do {
                   let fetchedTasks = try await networkService.fetchService(url)

                   let json = try  JSONDecoder().decode(ResultResponse.self, from: fetchedTasks)
                
                   try await completion(.success(json))
               } catch {
                   try await completion(.failure(error))
                   print("Error fetching tasks: \(error)")
               }
           }
       }
}
