//
//  AddView.swift
//  DayTracker
//
//  Created by Ozgu Ozden on 2022/04/06.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var oneDayPlans: OneDayPlans
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var detail = ""
    
    @State var hours = 0
    @State var minutes = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")){
                    TextField("Name", text: $name)
                    TextField("Description", text: $detail)
                }
                Section(header: Text("Time Spent")){
                    HStack {
                        Picker("", selection: $hours){
                            ForEach(0..<25, id: \.self) { i in
                                Text("\(i) hours").tag(i)
                            }
                        }
                        .frame(width: 100)
                        .clipped()
                        .pickerStyle(WheelPickerStyle())
                        
                        Picker("", selection: $minutes){
                            ForEach(0..<60, id: \.self) { i in
                                Text("\(i) min").tag(i)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                }
            }
            .navigationTitle("Add New")
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        let item = OneDay(name: name, detail: detail, hours: hours, minutes: minutes)
                        oneDayPlans.plans.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction ) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(oneDayPlans: OneDayPlans())
    }
}
