//
//  UploadTweetViewModel.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/11/04.
//

import UIKit


enum UploadTweetConfiguration {
    case tweet
    case reply(Tweet)
}

struct UploadTweetViewModel {
    let actionButtonTitle: String
    let placeholderText: String
    let shouldShowReplyLabel: Bool
    var replyText: String?
    
    init(config: UploadTweetConfiguration) {
        switch config {
        case .tweet:
            actionButtonTitle = "Tweet"
            placeholderText = "What's happening"
            shouldShowReplyLabel = false
        case .reply(let tweet):
            actionButtonTitle = "Reply"
            placeholderText = "Tweet your reply"
            shouldShowReplyLabel = true
            replyText = "Replying to @\(tweet.user.username)"
        }
    }
}
