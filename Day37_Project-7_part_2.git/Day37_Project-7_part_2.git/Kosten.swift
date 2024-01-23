//
//  Expenses.swift
//  Day37_Project-7_part_2.git
//
//  Created by Elias Breitenbach on 02.08.23.
//

import Foundation

class Kosten: ObservableObject {
    @Published var items = [SpesenPosten]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let gespeichertesTeil = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([SpesenPosten].self, from: gespeichertesTeil) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
