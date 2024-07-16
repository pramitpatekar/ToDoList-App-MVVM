//
//  ListRowView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
            
        }
    }
}


#Preview {
    ListRowView(title: "This is the First Title!")
}
