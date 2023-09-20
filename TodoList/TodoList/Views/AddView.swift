//
//  AddView.swift
//  TodoList
//
//  Created by Ahmed Fathi on 19/09/2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var backToMainScreen
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type some thing here....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                .cornerRadius(10)
                Button {
                    saveButtonPreessed()
                } label: {
                    Text("save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 👐🏻")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    func saveButtonPreessed(){
        if textIsAppropriate() {
            listViewModel.AddItem(title: textFieldText)
            backToMainScreen.wrappedValue.dismiss()
        }
      
    }
    func textIsAppropriate()-> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Put at least 3 charctars 😏 !!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert()-> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
