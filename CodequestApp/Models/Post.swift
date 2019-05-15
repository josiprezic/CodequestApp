//
//  Post.swift
//  CodequestApp
//
//  Created by Korisnik on 15/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

class Post {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
