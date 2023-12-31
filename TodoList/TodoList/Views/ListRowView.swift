//
//  ListRowView.swift
//  TodoList
//
//  Created by Ahmed Fathi on 19/09/2023.
//

import SwiftUI

struct ListRowView: View {
    let Item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: Item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(Item.isCompleted ? .green : .red)
            Text(Item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical , 8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "firstitem", isCompleted: true)
    static var item2 = ItemModel(title: "second", isCompleted: false)
    static var previews: some View {
        Group{
            ListRowView(Item: item1)
            ListRowView(Item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
