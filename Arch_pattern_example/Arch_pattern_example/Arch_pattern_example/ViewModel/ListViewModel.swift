////
////  ListViewModel.swift
////  Yassir_test
////
////  Created by Alaa Gaber on 22/11/2024.
////
//
//import Foundation
//
//class ListViewModel {
//    var isLoading = false
//    var error: Error?
//    var items: [Item] = []
//    
//    private let networkService = NetworkService()
//    
//    
//    func fetchData(completion: @escaping (Result<[Item], Error>) -> Void){
//        Task {
//            self.isLoading = true
//            do{
//                let items = try await networkService.fetchCharactersItems()
//                self.items = items
//                self.isLoading = false
//                completion(.success(items))
//            }catch {
//                print(error.localizedDescription)
//                self.error = error
//                self.isLoading = false
//                completion(.failure(error))
//            }
//        }
//    }
//}
