//
//  VideoTableViewCell.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-12.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setCell(_ v:Video){
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else{
            return
        }
        // Set the title
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else{
            return
        }
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail){
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL session object
        let session = URLSession.shared
        
        //create a data task
        let dataTask = session.dataTask(with: url!) { (data,response, error) in
            if error == nil && data != nil{
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail{
                    return
                }
                //create the image object
                let image  = UIImage(data:data!)
                
                // set the imageView
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        dataTask.resume()
    }

}



















