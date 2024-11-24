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

    func fetchTasks (completion: @escaping (Result<[Item], Error>) async throws-> Void) {
           // Perform the fetch operation in an async context
           Task {
//               self.isLoading = true
               do {
                   let fetchedTasks = try await networkService.fetchService(Endpoint.characters)
                   let json = try  JSONDecoder().decode(ResultResponse.self, from: fetchedTasks)
                
                   try await completion(.success(json.results))
               } catch {
//                   self.error = error
//                   self.isLoading = false
                   try await completion(.failure(error))
                   print("Error fetching tasks: \(error)")
               }
           }
       }
    
    
//    func fetchData(completion: @escaping (Result<[Item], Error>) async throws -> Void){
    //            Task {
    //                self.isLoading = true
    //                do{
    //                    let items = try await networkService.fetchCharactersItems()
    //                    self.items = items
    //                    self.isLoading = false
    //                    completion(.success(items))
    //                }catch {
    //                    print(error.localizedDescription)
    //                    self.error = error
    //                    self.isLoading = false
    //                    completion(.failure(error))
    //                }
    //            }
    //        }
}
