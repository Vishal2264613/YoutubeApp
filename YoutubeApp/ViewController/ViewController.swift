//
//  ViewController.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,ModelDelegate {
  
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set itself as a datasource and delegate
        TableView.dataSource = self
        TableView.delegate = self
        model.delegate = self
        model.getVideos()
    }
    func videoFetched(_ videos: [Video]) {
        self.videos = videos
        
        TableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
















