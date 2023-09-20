//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ahmed Fathi on 20/09/2023.
//

import Foundation
class ListViewModel: ObservableObject {
     
    @Published var items :[ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey = "items_list"
    
    init() {
       getItems()
    }
    func getItems(){

        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
                
        else{return}
        self.items = savedItems 
    }
    func deleteItems(indexset:IndexSet){
        items.remove(atOffsets: indexset)
    }
    func moveItem(from: IndexSet , to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func AddItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.ubdateCompletion() }
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
