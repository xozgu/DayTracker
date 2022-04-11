//
//  ContentView.swift
//  DayTracker
//
//  Created by Ozgu Ozden on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var oneDayPlans = OneDayPlans()
    @State private var showingAddNew = false
    @State private var selectedDate = Date()
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(oneDayPlans.plans) { item in
                    NavigationLink {
                        Text(item.name)
                        Text(item.detail)
                        HStack {
                            Text("\(item.hours) hours")
                            Text("\(item.minutes) minutes")
                        }
                        
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.detail)
                                HStack {
                                    Text("\(item.hours) hours")
                                    Text("\(item.minutes) minutes")
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarItems(
                leading: DatePicker(selection: $selectedDate, in: ...Date(), displayedComponents: .date) {
                    
                }
            )
            .toolbar {
                Button {
                    showingAddNew = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddNew) {
                AddView(oneDayPlans: oneDayPlans)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        oneDayPlans.plans.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
