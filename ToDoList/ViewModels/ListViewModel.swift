//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Ref on 17/07/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the First Title", isCompleted: false),
            ItemModel(title: "This is the Second Title", isCompleted: true),
            ItemModel(title: "This is the Third Title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { existingItem in
            return existingItem.id == item.id
        }) {
            items[index] = item.updateCompletion()
        }
    }
    
}
