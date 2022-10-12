//
//  Item.swift
//  Todoey
//
//  Created by boockich mac on 11.10.2022.
//

import Foundation

struct Item: Codable {
    var title: String
    var done: Bool = false
}