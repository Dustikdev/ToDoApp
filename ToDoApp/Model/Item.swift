//
//  CellModel.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.12.2022.
//

import Foundation
import RealmSwift

class Item: Object {
    @Persisted var cellLabelText: String = ""
    @Persisted var checkMarkisHidden: Bool = true
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}


