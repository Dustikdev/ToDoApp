//
//  Data.swift
//  ToDoApp
//
//  Created by Никита Швец on 27.12.2022.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    @Persisted var categoryColor: String = "C7C7CC"
    @Persisted var items: List<Item>
}
