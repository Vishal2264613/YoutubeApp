//
//  ViewController.swift
//  YoutubeApp
//
//  Created by vishal pawar on 2021-11-12.
//

import UIKit

class ViewController: UIViewController {
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}
















