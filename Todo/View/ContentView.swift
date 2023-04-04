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
    @State private var showingAddTodoView: Bool = false
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello, World!")
            }
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showingAddTodoView.toggle()
            }) {
                Image(systemName: "plus")
            } //: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView()
                }
            )
            
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
