////
////  ItemViewModel.swift
////  Yassir_test
////
////  Created by Alaa Gaber on 22/11/2024.
////
//
//import Foundation
//
//class ItemViewModel: ObservableObject{
//
//    
//    @Published var rickyAndMortyURLs: RickyAndMortyURLs?
//    @Published var isLoaded: Bool = false
//    @Published var error: Error?
//    
//    private let networkService = NetworkService()
//    
//    
//    
//    func fetchItem() {
//        DispatchQueue.main.async{
//            
//            Task {
//                self.isLoaded = true
//                do {
//                    let rickyAndMortyURLs = try await self.networkService.fetchURLs()
//                    self.rickyAndMortyURLs = rickyAndMortyURLs
//                } catch {
//                    print(error)
//                    self.error = error
//                    self.isLoaded = false
//                }
//                self.isLoaded = false
//            }
//        }
//        
//    }
//    
//}
