//
//  OneDay.swift
//  DayTracker
//
//  Created by Ozgu Ozden on 2022/04/06.
//

import Foundation

struct OneDay: Identifiable, Codable {
    var id = UUID()
    let name: String
    let detail: String
    let hours: Int
    let minutes: Int
    
}
