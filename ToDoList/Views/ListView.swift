//
//  ListView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the First Title", isCompleted: false),
        ItemModel(title: "This is the Second Title", isCompleted: true),
        ItemModel(title: "This is the Third Title", isCompleted: false)
    ]
    
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("ToDo List")
        .navigationBarItems(
            leading: EditButton().font(.headline), 
            trailing: NavigationLink("Add", destination: AddView())
        )
        .listStyle(PlainListStyle())
    }
}

#Preview {
    NavigationView{
        ListView()
    }
}


