//
//  RecyclingCenterView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/03/25.
//

import SwiftUI
import MapKit
struct RecyclingCenter: Identifiable {
        let id = UUID()
        let name: String
        let address: String
        let acceptedMaterials: String
        let coordinate: CLLocationCoordinate2D
    }

    let sampleCenters = [
        RecyclingCenter(name: "Green Drop Center", address: "123 Eco Street", acceptedMaterials: "Plastic, Paper, Metal", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        RecyclingCenter(name: "Eco Recycle Hub", address: "456 Greenway Blvd", acceptedMaterials: "Electronics, Glass, Metal", coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094))
    ]

    struct RecyclingCenterView: View {
        @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        var body: some View {
            NavigationStack {
                VStack {
                    // **Map View**
                    Map(coordinateRegion: $region, annotationItems: sampleCenters) { center in
                        MapAnnotation(coordinate: center.coordinate) {
                            VStack {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.red)
                                Text(center.name)
                                    .font(.caption)
                                    .bold()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(5)
                            }
                        }
                    }
                    .frame(height: 300)
                    .cornerRadius(15)
                    .padding()
                    
                    // **List of Recycling Centers**
                    List(sampleCenters) { center in
                        VStack(alignment: .leading) {
                            Text(center.name)
                                .font(.headline)
                            Text(center.address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("Accepted: \(center.acceptedMaterials)")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .navigationTitle("Recycling Centers")
            }
        }
    }

    

#Preview {
    RecyclingCenterView()
}
