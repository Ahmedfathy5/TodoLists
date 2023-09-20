//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ahmed Fathi on 19/09/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
           
        }
    }
}
