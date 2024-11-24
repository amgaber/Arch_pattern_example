//
//  Item.swift
//  Yassir_test
//
//  Created by Alaa Gaber on 22/11/2024.
//

import Foundation

struct ResultResponse: Codable {
    let info :Info
    let results:[Item]
}

struct Info: Codable {
    let count:Int
    let next:String?
    let prev:String?
    let pages:Int
}
struct Item: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
