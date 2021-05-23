//
//  ContentView.swift
//  LengthConverter
//
//  Created by Vladimir on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var firstUnit = Unit.km.rawValue
    @State private var secondUnit = Unit.m.rawValue
    @State private var number = ""
    var result: Double {
        let unitOne = Unit(rawValue: firstUnit)
        let unitTwo = Unit(rawValue: secondUnit)
        let length = Double(number) ?? 0
        
        return length * unitConvertor(first: unitOne!, second: unitTwo!)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose first unit")) {
                    Picker("Choose first unit", selection: $firstUnit) {
                        ForEach(Unit.allCases) { unit in
                            Text("\(unit.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose second unit")) {
                    Picker("Choose first unit", selection: $secondUnit) {
                        ForEach(Unit.allCases) { unit in
                            Text("\(unit.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section {
                    TextField("Enter number", text: $number)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Text("Result of conversion is: \(result)")
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}

enum Unit: String, CaseIterable, Identifiable {
    
    case m
    case km
    case feet
    case yards
    case miles
    var id: String { self.rawValue }
}

func unitConvertor(first: Unit, second: Unit) -> Double {
    
    let pair = (first, second)
    
    switch pair {
    case (.m, .m): return 1
    case (.m, .km): return 0.001
    case (.m, .feet): return 3.28084
    case (.m, .yards): return 1.09361
    case (.m, .miles): return 0.000621371
        
    case (.km, .km): return 1
    case (.km, .m): return 1000
    case (.km, .feet): return 3280.84
    case (.km, .yards): return 1093.6133
    case (.km, .miles): return 0.62137
        
    case (.feet, .feet): return 1
    case (.feet, .m): return 0.3048
    case (.feet, .km): return 0.0003048
    case (.feet, .yards): return 0.333333
    case (.feet, .miles): return 0.000189394
        
    case (.yards, .yards): return 1
    case (.yards, .m): return 0.9144
    case (.yards, .km): return 0.0009144
    case (.yards, .feet): return 3
    case (.yards, .miles): return 0.000568182
        
    case (.miles, .miles): return 1
    case (.miles, .m): return 1609.34
    case (.miles, .km): return 1.60934
    case (.miles, .feet): return 5280
    case (.miles, .yards): return 1760
        
    }
    
}
