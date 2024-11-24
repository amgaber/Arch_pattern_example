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
            AsyncImage(url: URL(string: imageURL)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image(systemName: "person.fill.questionmark").resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
                        
                }
            .frame(width: 80,height: 80)
            
                
            
            VStack(alignment: .leading){
                Text(name)
            }
            .padding()
        }
    }
}

#Preview {
    CellView(name: "alaa", imageURL: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", species: Species.human.rawValue)
}
