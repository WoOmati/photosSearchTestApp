//
//  PhotoModel.swift
//  photosSearchTestApp
//
//  Created by macbook on 16.09.2021.
//

import Foundation

struct SearchResponse: Decodable {
    let total: Int
    let results: [Image]
}

struct Image: Decodable {
   let id: String
   let imageUrl: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let imageURLs = try container.decode(ImageURL.self, forKey: .imageUrl)
        imageUrl = imageURLs.regular
    }

   enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "urls"
    }
    
    
    private struct ImageURL: Decodable {
        let regular: String
    }

}
