//
//  ContentView.swift
//  Todo
//
//  Created by Rafał Gęsior on 04/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Todo.entity(), sortDescriptors:  [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @State private var showingAddTodoView: Bool = false
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unknown")
                    } //
                } //: LOOP
                .onDelete(perform: delete)
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                self.showingAddTodoView.toggle()
            }) {
                Image(systemName: "plus")
            } //: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView().environment(\.managedObjectContext, self.viewContext)
                }
            )
        } //: NAVIGATION
    }
    //MARK: - FUNCTION
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            viewContext.delete(todo)
            
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
