//
//  UserService.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/11.
//

import Firebase

struct UserService {
    
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }

            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
            
            
        }

        
    }
    
}
