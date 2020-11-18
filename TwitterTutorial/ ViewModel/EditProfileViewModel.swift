//
//  EditProfileViewModel.swift
//  TwitterTutorial
//
//  Created by 白数叡司 on 2020/11/18.
//

import Foundation

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio
    
    var description: String {
        switch self {
        case .username: return "Username"
        case .fullname: return "Name"
        case .bio: return "Bio"
        }
    }
}
