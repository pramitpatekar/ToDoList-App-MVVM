//
//  AddView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                })
            }
            .padding()

        }
        .navigationTitle("Add an Item")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
