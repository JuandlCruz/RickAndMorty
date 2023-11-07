//
//  CharactersLogic.swift
//  RickAndMorty
//
//  Created by Juan on 6/11/23.
//

import SwiftUI

@Observable
final class CharactersLogic {
    let network: NetworkInteractor
    var characters: [CharacterModel] = []
    var currentPage: Int = 1
    var isFetching = false
    
    init(network: NetworkInteractor = Network()) {
        self.network = network
        loadMoreCharacters()
    }
    
    func loadMoreCharacters() {
        guard !isFetching else {
            return
        }
        
        isFetching = true
        
        network.loadCharacters(page: currentPage) { [self] newCharacters, error in
            defer { isFetching = false }
            
            if let error = error {
                print(error)
                return
            }
            
            if let newCharacters = newCharacters {
                characters.append(contentsOf: newCharacters)
                currentPage += 1
            }
        }
    }
}

extension CharacterModel {
    static let test = CharacterModel(id: 1, name: "Juan de la Cruz", status: "Alive", species: "Human", type: "", gender: "Male", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "https://rickandmortyapi.com/api/location/1", episode: [])
}
