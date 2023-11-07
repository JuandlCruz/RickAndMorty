//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Juan on 6/11/23.
//

import SwiftUI

struct CharactersListView: View {
    @State var vm = CharactersLogic()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(searchResults) { character in
                NavigationLink(value: character) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: { }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        Text(character.name)
                    }
                }
                .onAppear {
                    vm.loadMoreCharacters()
                }
            }
            .navigationBarTitle("Rick and Morty")
            .navigationDestination(for: CharacterModel.self) { character in
                DetailCharacterView(character: character)
            }
            .searchable(text: $searchText)
            
        }
        
        var searchResults: [CharacterModel] {
            if searchText.isEmpty {
                return vm.characters
            } else {
                return vm.characters.filter { $0.name.contains(searchText) }
            }
        }
    }
}

#Preview {
    CharactersListView()
}
