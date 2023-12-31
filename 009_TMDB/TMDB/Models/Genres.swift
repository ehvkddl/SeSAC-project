//
//  Genres.swift
//  TMDB
//
//  Created by do hee kim on 2023/08/12.
//

import Foundation

// MARK: - Welcome
struct Genres: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

class GenreManager {
    static let shared = GenreManager()
    private var genreDict: [Int: String] = [:]
    
    private init() {}
  
    func convertText(with id: Int) -> String {
        guard let text = genreDict[id] else { return "no genre" }
        
        return text
    }
    
    func updateGenreDict(id: Int, name: String) {
        self.genreDict[id] = name
    }
    
}
