//
//  NetworkInteractor.swift
//  RickAndMorty
//
//  Created by Juan on 6/11/23.
//

import Foundation

protocol NetworkInteractor {
    func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?, Error?) -> Void)
}

struct Network: NetworkInteractor {
    func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        guard let url = URL(string: urlString) else {
            completion(nil, APIError.invalidURL)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, APIError.noData)
                return
            }

            do {
                let charactersResponse = try JSONDecoder().decode(CharacterModelResponse.self, from: data)
                completion(charactersResponse.results, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

