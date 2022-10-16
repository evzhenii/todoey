//
//  Category.swift
//  Todoey
//
//  Created by boockich mac on 14.10.2022.
//

import Foundation
import RealmSwift


class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

