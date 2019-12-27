//
//  PostData.swift
//  Hacker News
//
//  Created by Janet Van on 23.12.2019.
//  Copyright © 2019 Janet Van. All rights reserved.
//

import Foundation
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
