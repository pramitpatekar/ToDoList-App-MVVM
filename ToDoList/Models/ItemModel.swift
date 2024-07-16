//
//  ItemModel.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
