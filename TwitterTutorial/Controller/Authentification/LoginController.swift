//
//  LoginController.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/08.
//

import UIKit

class LoginController: UIViewController {
    
    private let logoImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image  = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
    }
    
}
