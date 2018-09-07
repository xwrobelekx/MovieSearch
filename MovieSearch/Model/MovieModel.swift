//
//  MovieModel.swift
//  MovieSearch
//
//  Created by Kamil Wrobel on 9/7/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation

struct JsonDictionary: Decodable {
    let results : [Movie]
}


struct Movie: Decodable {
    
    let title: String
    let overview: String
    let rating: Double
    let posterImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case overview
        case rating = "vote_average"
        case posterImage = "poster_path"
        
        
    }
}
