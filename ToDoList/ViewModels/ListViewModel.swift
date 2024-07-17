//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Ref on 17/07/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
        //Anytime we change this items array the didSet function will get called and the saveItems() function will run
    }
    
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the First Title", isCompleted: false),
//            ItemModel(title: "This is the Second Title", isCompleted: true),
//            ItemModel(title: "This is the Third Title", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }                        // .self is done because we want it to be the type of [ItemModel] and not an actual array.
        self.items = savedItems
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
        /*  if let index = items.firstIndex(where: { existingItem in
         return existingItem.id == item.id
         }) {
         items[index] = item.updateCompletion()
         } SAME AS BELOW*/
    
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
}
