//
//  cellView.swift
//  Yassir_test
//
//  Created by Alaa Gaber on 22/11/2024.
//

import SwiftUI

struct CellView: View {
    static let identifier: String = "CellUITableViewCell"

    var name:String
    var imageURL:String
    var species:String
    
    var body: some View {
        HStack(){
            ImageUIView(imageURL: imageURL)
                .frame(width: 80,height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading){
                Text(name)
                    .font(.subheadline.bold())
                Text(species)
                    .font(.footnote.weight(.light))
            }
            .padding()
        }
    }
}

#Preview {
    CellView(name: "alaa", imageURL: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", species: "Human")
}
