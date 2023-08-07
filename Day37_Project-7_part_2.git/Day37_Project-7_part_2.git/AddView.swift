//
//  AddView.swift
//  Day37_Project-7_part_2.git
//
//  Created by Elias Breitenbach on 04.08.23.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Privat"
    @State private var amount = 0.0
    @ObservedObject var kosten : Kosten
    @Environment(\.dismiss) var entfernen
    
    let types = ["Privat", "Geschäftlich"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "EUR")) .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    entfernen()
                    let item = SpesenPosten(name: name, type: type, amount: amount)
                    kosten.items.append(item)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(kosten: Kosten())
    }
}
