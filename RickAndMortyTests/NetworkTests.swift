//
//  NetworkTests.swift
//  RickAndMortyTests
//
//  Created by Juan on 7/11/23.
//

import XCTest
@testable import RickAndMorty

class NetworkTests: XCTestCase {
    func testLoadCharactersWithValidURL() {
        let network = Network()
        let expectation = self.expectation(description: "Loading characters should succeed")
        
        network.loadCharacters(page: 1) { characters, error in
            XCTAssertNil(error)
            XCTAssertNotNil(characters)
            XCTAssertEqual(characters?.first?.name, "Rick Sanchez")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadCharactersWithInvalidURL() {
        let network = Network()
        let expectation = self.expectation(description: "Loading characters with an invalid URL should fail")
        
        network.loadCharacters(page: 999) { characters, error in
            XCTAssertNotNil(error)
            XCTAssertNil(characters)
            XCTAssertNotEqual(characters?.first?.name, "Rick Sanchez")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
