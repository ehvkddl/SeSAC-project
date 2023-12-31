//
//  Photo.swift
//  Unsplash
//
//  Created by do hee kim on 2023/09/13.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]
}

struct PhotoResult: Codable {
    let id: String
    let urls: PhotoURL
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}
