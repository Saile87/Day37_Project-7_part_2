//
//  ExpenseItem.swift
//  Day37_Project-7_part_2.git
//
//  Created by Elias Breitenbach on 02.08.23.
//

import Foundation

struct SpesenPosten: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
