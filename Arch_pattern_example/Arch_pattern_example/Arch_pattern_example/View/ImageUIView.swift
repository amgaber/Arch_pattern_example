//
//  ImageUIView.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import SwiftUI

struct ImageUIView: View {
    let imageURL:String
    var body: some View {
        GeometryReader { geo in
            AsyncImage(url: URL(string: imageURL)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image(systemName: "person.fill.questionmark").resizable()
                        .scaledToFit()
                } else {
                    ProgressSwiftUIView()
                }
            }
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
        }
    }
}

#Preview {
    ImageUIView(imageURL: "https://rickandmortyapi.com/api/character/avatar/361.jpeg")
}
