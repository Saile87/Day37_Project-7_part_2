//
//  ContentView.swift
//  Day37_Project-7_part_2.git
//
//  Created by Elias Breitenbach on 02.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kosten = Kosten()
    @State private var showingAddKosten = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(kosten.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iKosten")
            
            .toolbar {
                Button {
                    showingAddKosten = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddKosten) {
                AddView(kosten: kosten)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        kosten.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
