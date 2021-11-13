//
//  Response.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-12.
//

import Foundation

struct Response: Decodable{
    var item: [Video]?
    
    enum CodingKeys: String, CodingKey{
        case items
    }
    init(from decoder:Decoder) throws{
        let container = try
        decoder.container(keyedBy: CodingKeys.self)
        
        self.item = try container.decode([Video].self, forKey: .items)
    }
}
