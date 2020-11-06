//
//  ActionSheetViewModel.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/11/06.
//

import Foundation

struct ActionSheetViewModel {
    private let user: User
    
    var options: [ActionSheetOpitions] {
        var results = [ActionSheetOpitions]()
        
        if user.isCurrentUser {
            results.append(.delete)
        } else {
            let followOption: ActionSheetOpitions = user.isFollowed ? .unfollow(user) : .follow(user)
            results.append(followOption)
        }
        results.append(.report)
        results.append(.blockUser)
        return results
    }
    
    init(user: User) {
        self.user = user
    }
}

enum ActionSheetOpitions {
    case follow(User)
    case unfollow(User)
    case report
    case delete
    case blockUser
    
    var descripiton: String {
        switch self {
        case .follow(let user):
            return "Follow @\(user.username)"
        case .unfollow(let user):
            return "Unfollow @\(user.username)"
        case .report:
            return "Report Tweet"
        case .delete:
            return "Delete Tweet"
        case .blockUser:
            return "Block user"
        }
    }
}
