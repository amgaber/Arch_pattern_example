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
     case characters(_ page: Int)
    case episodes(_ page: Int)
    case locations(_ page: Int)
    case seasons(_ page: Int)
    
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
        case .characters(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        case .episodes(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        case .locations(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        case .seasons(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        }
    }
}
