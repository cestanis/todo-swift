//
//  ContentView.swift
//  todo-swift
//

import SwiftUI

struct ContentView: View {
    
    @State private var todoItems: [TodoItem] = []
    @State private var newTodo: String = ""
    
    var body: some View {
        VStack {
            Text("Get Todo")
            HStack{
                TextField("New todo", text: $newTodo) //to create a two-way binding to a mutable state
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                Button(action: {
                    if !newTodo.isEmpty {
                        let item = TodoItem(text: newTodo)
                        todoItems.append(item)
                        newTodo = ""
                    }
                }) {
                    Image(systemName: "plus")
                        .padding(10)
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            
            .padding()
            
            List(todoItems) { item in
                Text(item.text)
            }
        }
    }
}


struct TodoItem : Identifiable {
    var id = UUID()
    var text: String
}



#Preview {
    ContentView()
}
