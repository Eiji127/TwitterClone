//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/08.
//

import UIKit

class  FeedCotroller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI(){
        
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        
    }
    
}
