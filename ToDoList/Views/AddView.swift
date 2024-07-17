//
//  AddView.swift
//  ToDoList
//
//  Created by Ref on 16/07/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode                //monitors where we are in the view hierarchy
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: 800)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 800)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                        
                })
            }
            .padding()

        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()           //tells the presentationMode to go back one screen in the view hierarchy
            textFieldText = ""

        }
                  
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new ToDo List item must have atleast 3 characters!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
    
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
