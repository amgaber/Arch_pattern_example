    //
    //  DetailView.swift
    //  Yassir_test
    //
    //  Created by Alaa Gaber on 23/11/2024.
    //

    import SwiftUI

    struct DetailView: View {
        let name:String
        let imageURL:String
        let location: String
        let gender: String
        let species: String
        
        var body: some View {
            
            VStack{
                ImageUIView(imageURL: imageURL)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            Text(name)
                                .font(.title)
                                .bold()
                            HStack {
                                Text("\(species)")
                                Text("\(gender)")
                            }
                            Text("Location: \(location)")
                        }
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .foregroundStyle(.blue)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                
                    Spacer()
                    
                }
            }
        }
    }

    #Preview {
        DetailView(name: "Alaa", imageURL: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", location: "Earth", gender: "Male", species: "ELF")
    }
