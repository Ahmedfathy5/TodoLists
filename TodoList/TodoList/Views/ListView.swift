//
//  ListView.swift
//  TodoList
//
//  Created by Ahmed Fathi on 19/09/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                Text("No items")
            } else {
                List{
                    ForEach(listViewModel.items) { fruit in
                    ListRowView(Item:  fruit)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: fruit )
                                }
                            }
                    
                    }
                    .onDelete (perform: listViewModel.deleteItems)
                    .onMove (perform: listViewModel.moveItem)
                }
            }
                
        }
        .listStyle(PlainListStyle())
        .navigationTitle("TodoList❤️‍🔥")
        .toolbar {
            ToolbarItem (placement: .navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                   AddView()
                }
            }
        }
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


