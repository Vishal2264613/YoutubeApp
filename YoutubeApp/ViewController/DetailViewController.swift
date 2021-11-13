//
//  DetailViewController.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-13.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var textView: UITextView!
    
    var video : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard video != nil else{
            return
        }
        
        let embedUrl = Constants.YT_EMBEDED_URL + video!.videoId
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        //set title
        titleLabel.text = video!.title
        //set Date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        textView.text = video!.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


















