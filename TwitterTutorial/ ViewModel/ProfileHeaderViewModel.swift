//
//  ProfileFilterOption.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/10/20.
//

import Foundation

enum ProfileFilterOption: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Tweets & Replies"
        case .likes:
            return "Likes"
        }
    }
}
