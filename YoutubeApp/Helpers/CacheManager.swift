//
//  cacheManager.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-13.
//

import Foundation

class CacheManager{
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        
        cache[url] = data
        
    }
    static func getVideoCache(_ url:String) -> Data?{
        
        return cache[url]
        
    }
}


















