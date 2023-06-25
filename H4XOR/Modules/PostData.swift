//
//  PostData.swift
//  H4XOR
//
//  Created by Emilio Henrique Corrêa on 25/06/23.
//

import Foundation

struct Results: Decodable {
    let hits:  [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
