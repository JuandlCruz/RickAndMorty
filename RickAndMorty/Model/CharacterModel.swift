//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Juan on 6/11/23.
//

import Foundation

struct CharacterModelResponse: Codable {
    var results: [CharacterModel]
}

struct CharacterModel: Codable, Identifiable, Hashable {
    let id: Int
    var name, status, species, type: String
    var gender: String
    var origin, location: Location
    var image: String
    var episode: [String]
}

struct Location: Codable, Hashable {
    let name: String
    let url: String
}

