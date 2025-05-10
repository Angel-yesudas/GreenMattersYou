//
//  AddressConfirmationView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import Foundation
import SwiftUI
import CoreLocation
struct AddressConfirmationView: View {
@Binding var selectedAddress: String?
@Environment(\.presentationMode) var presentationMode
@State private var addressInput: String = ""
@State private var locationManager = CLLocationManager()

var body: some View {
    VStack(spacing: 20) {
        TextField("Enter your address", text: $addressInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        Button("Use Current Location") {
            getCurrentLocation()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        
        Button("Confirm") {
            selectedAddress = addressInput
            presentationMode.wrappedValue.dismiss()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
    .padding()
    .navigationTitle("Confirm Address")
}

// ✅ Fetch Current Location (Requires Location Permissions)
func getCurrentLocation() {
    locationManager.requestWhenInUseAuthorization()
    if let location = locationManager.location {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                addressInput = "\(placemark.name ?? ""), \(placemark.locality ?? ""), \(placemark.country ?? "")"
            }
        }
    }
}
}
