//
//  SideMenuAction.swift
//  TwitterClone
//
//  Created by Pratha Saxena on 11/01/23.
//

import Foundation

enum SideMenuAction: String, CaseIterable {
    case profile
    case topics
    case bookMarks
    case lists
    case circle
    
    var title : String {
        switch self {
        case .profile: return "Profile"
        case .topics: return "Topics"
        case .bookMarks: return "Bookmarks"
        case .lists: return "Lists"
        case .circle: return "Twitter Circle"
        }
    }
    
    var icon : String {
        switch self {
        case .profile: return "person"
        case .topics: return "plus.message"
        case .bookMarks: return "bookmark"
        case .lists: return "list.bullet.rectangle.portrait"
        case .circle: return "person.wave.2"
        }
    }
}
