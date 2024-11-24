//
//  Endpoint.swift
//  Yassir_test
//
//  Created by Alaa Gaber on 22/11/2024.
//

import Foundation

let baseURLString = "https://rickandmortyapi.com/api/"

 enum Endpoint {
    
    case baseURL
    case characters
    case episodes
    case locations
    case seasons
    
    var path: String {
        switch self {
        case .baseURL: return baseURLString
        case .characters: return baseURLString + "character"
        case .episodes: return baseURLString + "episode"
        case .locations: return baseURLString + "location"
        case .seasons: return baseURLString + "season"
        }
    }
    
    var url: URL? {
        switch self {
        case .baseURL: return URL(string: path)
        case .characters: return URL(string: path)
        case .episodes: return URL(string: path)
        case .locations: return URL(string: path)
        case .seasons: return URL(string: path)
        }
    }
}
