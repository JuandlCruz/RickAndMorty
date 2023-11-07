//
//  DetailCharacterView.swift
//  RickAndMorty
//
//  Created by Juan on 7/11/23.
//

import SwiftUI

struct DetailCharacterView: View {
    let character: CharacterModel
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image))
            Form {
                Section(header: Text("Character Details")) {
                    LabeledContent("Name", value: character.name)
                    LabeledContent("Status", value: character.status)
                    LabeledContent("Species", value: character.species)
                    LabeledContent("Type", value: character.type)
                    LabeledContent("Gender", value: character.gender)
                    LabeledContent("Origin", value: character.origin.name)
                    LabeledContent("Location", value: character.location.name)
                    LabeledContent("Episodes number", value: character.episode.count.description)
                }
            }
            .navigationTitle("Character Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DetailCharacterView(character: .test)
}
