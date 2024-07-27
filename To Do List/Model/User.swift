//
//  User.swift
//  To Do List
//
//  Created by Pillars Fintech on 03/09/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
