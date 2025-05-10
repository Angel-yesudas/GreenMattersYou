//
//  WasteSegregationView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI

struct WasteSegregationView: View {
    var body: some View {
                VStack(spacing: 20) {
                    Text("Waste Segregation Guide")
                        .font(.title)
                        .bold()

                    List {
                        Section(header: Text("Organic Waste")) {
                            Text("🍎 Food scraps, leaves, garden waste")
                        }
                        Section(header: Text("Recyclables")) {
                            Text("📦 Paper, glass, metal, plastic")
                        }
                        Section(header: Text("Hazardous Waste")) {
                            Text("🛢 Batteries, chemicals, e-waste")
                        }
                        Section(header: Text("Hazardous Waste")) {
                            Text("🛢 Batteries, chemicals, e-waste")
                        };Section(header: Text("Hazardous Waste")) {
                            Text("🛢 Batteries, chemicals, e-waste")
                        };Section(header: Text("Hazardous Waste")) {
                            Text("🛢 Batteries, chemicals, e-waste")
                        };Section(header: Text("Hazardous Waste")) {
                            Text("🛢 Batteries, chemicals, e-waste")
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                .padding()
                .navigationTitle("Segregation Guide")
            }
        }

       
       
    


#Preview {
    WasteSegregationView()
}
