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
        let species: String
        let status: String
        let location: String
        let gender: String
        
        var body: some View {
            
            VStack{
                ImageUIView(imageURL: imageURL)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            HStack {
                                Text(name)
                                    .font(.title)
                                    .bold()
                                Spacer()
                                Text(status)
                                    .padding(10)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            HStack {
                                Text("\(species)")
                                Text("\(gender)")
                            }
                            HStack {
                                Text("Location:")
                                    .font(.subheadline.bold())
                                Text("\(location)")
                                    .foregroundColor(.secondary)
                            }
                            
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
        DetailView(name: "Alaa", imageURL: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", species: "Elf", status: "Male", location: "Earth", gender: "Male")
    }
