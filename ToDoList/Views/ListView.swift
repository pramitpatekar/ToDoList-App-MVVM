//
//  ListView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the First Title!",
        "This is the Second Title!",
        "Third Title"
        
    ]
    
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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


