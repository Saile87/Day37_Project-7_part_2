//
//  ContentView.swift
//  Day37_Project-7_part_2.git
//
//  Created by Elias Breitenbach on 02.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Text", type: "Test", amount: 5.0)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
