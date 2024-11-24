////
////  TestView.swift
////  Yassir_test
////
////  Created by Alaa Gaber on 22/11/2024.
////
//
//import Foundation
//import SwiftUI
//
//public struct TestView: View {
//    @ObservedObject var itemViewModel: ItemViewModel
//    
//    public var body: some View {
//        NavigationStack {
//            if itemViewModel.isLoaded {
//                ProgressView()
//            }else if let error = itemViewModel.error {
//                Text(error.localizedDescription)
//            }else {
//                Text(itemViewModel.rickyAndMortyURLs?.characters ?? "")
//                Text(itemViewModel.rickyAndMortyURLs?.episodes ?? "")
//                Text(itemViewModel.rickyAndMortyURLs?.episodes ?? "")
//
//            }
//        }
//        .onAppear() {
//            itemViewModel.fetchItem()
//        }
//    }
//}
