//
//  Tweet.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/11.
//

import Foundation

struct Tweet {
    
    let caption: String
    let tweetID: String
    var likes: Int
    var timestamp: Date!
    let retweetCount: Int
    var user: User
    var didLike = false
    var replyingTo: String?
    
    init(user: User, tweetID: String, dictonary: [String: Any]) {
        self.tweetID = tweetID
        self.user = user
        
        self.caption = dictonary["caption"] as? String ?? ""
        self.likes = dictonary["likes"] as? Int ?? 0
        self.retweetCount = dictonary["retweets"] as? Int ?? 0
        
        if let timestamp = dictonary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
        if let replyingTo = dictonary["replyingTo"] as? String {
            self.replyingTo = replyingTo
        }
    }
}
