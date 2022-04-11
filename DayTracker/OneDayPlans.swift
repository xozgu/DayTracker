//
//  OneDayPlans.swift
//  DayTracker
//
//  Created by Ozgu Ozden on 2022/04/06.
//

import Foundation

class OneDayPlans: ObservableObject {
    @Published var plans = [OneDay]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(plans) {
                UserDefaults.standard.set(encoded, forKey:"Plans")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Plans") {
            if let decodedItems = try? JSONDecoder().decode([OneDay].self, from: savedItems) {
                plans = decodedItems
                return
            }
        }
        plans = []
    }
}
