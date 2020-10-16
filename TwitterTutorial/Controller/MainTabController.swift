//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/08.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    //MARK: - Properties
    
    var user: User? {
        
        didSet{
            
            guard let nav = viewControllers?[0] as? UINavigationController else { return }
            guard let feed = nav.viewControllers.first as? FeedCotroller else { return }
            
            feed.user = user
        }
        
    }
    
    let actionButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    //MARK: -Selectors
    @objc func actionButtonTapped() {
        
        guard let user = user else { return }
        let controller = UploadTweetController(user: user)
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logUserOut()
        view.backgroundColor = .twitterBlue
        authentificateUserAndConfigureUI()
        
    }
 
    
    // MARK: - API
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(uid: uid) { user in
            self.user = user
            
        }
        
    }
    
    
    func authentificateUserAndConfigureUI() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
                
            }
            print("DEBUG: User is NOT logged in..")
            
        } else {
            
            print("DEBUG: User is logged in..")
            configureViewControllers()
            configureUI()
            fetchUser()
        }
        
    }
    
    func logUserOut() {
         
         do {
             
             try Auth.auth().signOut()
             
         } catch let error {
             
             print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
             
         }
         
     }

    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
        
    }
    
    func configureViewControllers() {
        
        let feed = FeedCotroller(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(named: "home_unselected")!, rootViewController: feed)
        
        let explore = ExploreCotroller()
        let nav2 = templateNavigationController(image: UIImage(named: "search_unselected")!, rootViewController: explore)
        
        let notifications = NotificationCotroller()
        let nav3 = templateNavigationController(image: UIImage(named: "like_unselected")!, rootViewController: notifications)
        
        let conversations = ConversationCotroller()
        let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1")!, rootViewController: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
        
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
