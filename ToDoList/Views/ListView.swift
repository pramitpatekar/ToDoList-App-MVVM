//
//  ListView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
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
    .environmentObject(ListViewModel())
}


