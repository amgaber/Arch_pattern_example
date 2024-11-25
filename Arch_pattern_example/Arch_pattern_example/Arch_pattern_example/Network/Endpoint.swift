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
     case characters(_ page: Int, _ status: String)
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
        case .characters(let page, let status): return URL(string: path + (query(page: page, status: status)))
        case .episodes(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        case .locations(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        case .seasons(let page): return URL(string: path + (page > 0 ? "/?page=\(page)" : ""))
        }
    }
     
     
     //TODO: need fixes
     func  query( page: Int, status: String) -> String {
         var query = ""
         
         if page > 0 {
             if status.isEmpty {
                 query = "/?page=\(page)"
             }else {
                 query =  "/?page=\(page)&status=\(String(describing: status))"
             }
             
         } else {
           
             if status.isEmpty {
                 query = ""
             }else {
                 query =  "/?status=\(String(describing: status))"
             }
             
         }
         return query
     }
}

