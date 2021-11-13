//
//  Model.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-12.
//

import Foundation

protocol ModelDelegate{
    func videoFetched(_ videos:[Video])
}

class Model{
    
    var delegate: ModelDelegate?
    
    func getVideos(){
       
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        // Get a data task
        let datatask = session.dataTask(with: url!) { data, response, error in
            if error != nil || data == nil{
               
                return
            }
            do{
                
                //Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
               
               let response = try decoder.decode(Response.self, from: data!)
               

                if response.item != nil{
                    DispatchQueue.main.async {
                        self.delegate?.videoFetched(response.item!)
                    }
                }
                
                dump(response)
            }
            catch{
                
            }
            
        }
        
        // Kick off the task
        datatask.resume()
    }
}











