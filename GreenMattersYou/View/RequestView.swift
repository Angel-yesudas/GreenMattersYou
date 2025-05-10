//
//  RequestView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI
import CoreLocation

struct RequestView: View {
    @State private var selectedWasteType: String? = nil
    @State private var selectedDate: Date? = nil
    @State private var selectedAddress: String? = nil
    @State private var notes: String = ""
    @State private var showAlert = false 
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    // Waste Type Selection
                    NavigationLink(destination: WasteTypeSelectionView(selectedWasteType: $selectedWasteType)) {
                        RequestRow(icon: "trash", text: selectedWasteType ?? "Select Waste Type")
                    }
                    
                    // Date Selection
                    NavigationLink(destination: DatePickerView(selectedDate: $selectedDate)) {
                        RequestRow(icon: "calendar", text: selectedDate != nil ? formattedDate(selectedDate!) : "Select Pickup Date")
                    }
                    
                    // Address Confirmation
                    NavigationLink(destination: AddressConfirmationView(selectedAddress: $selectedAddress)) {
                        RequestRow(icon: "house", text: selectedAddress ?? "Address Confirmation")
                    }
                    // Notes Input Field
                    NavigationLink(destination: NotesView(notes: $notes)) {
                        RequestRow(icon: "note.text", text: notes.isEmpty ? "Add Notes" : notes)
                    }

                        
                    }
                    
                    
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Submit Button
                    Button(action: {
                        // Handle submit action
                    }) {
                        Text("Submit")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0) )
                            .cornerRadius(12)
                            .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
                .navigationTitle("Request Pickup")
            }
        }
    }
    
    
    
    
    
    //struct WasteTypeSelectionView: View {
    //    @Binding var selectedWasteType: String?
    //    @Environment(\.presentationMode) var presentationMode
    //
    //    let wasteTypes = [
    //        "Liquid Waste", "Solid Waste", "Organic Waste",
    //        "Recyclable Waste", "Hazardous Waste", "Industrial Waste"
    //    ]
    //
    //    var body: some View {
    //        List(wasteTypes, id: \.self) { type in
    //            Button(action: {
    //                selectedWasteType = type
    //                presentationMode.wrappedValue.dismiss() // Dismiss after selection
    //            }) {
    //                HStack {
    //                    Text(type)
    //                    Spacer()
    //                    if selectedWasteType == type {
    //                        Image(systemName: "checkmark.circle.fill")
    //                            .foregroundColor(.green)
    //                    }
    //                }
    //            }
    //        }
    //        .navigationTitle("Select Waste Type")
    //    }
    //}
    
    //struct DatePickerView: View {
    //    @Binding var selectedDate: Date?
    //    @Environment(\.presentationMode) var presentationMode
    //
    //    @State private var tempDate = Date()
    //
    //    var body: some View {
    //        VStack {
    //            DatePicker("Select Pickup Date", selection: $tempDate, displayedComponents: .date)
    //                .datePickerStyle(GraphicalDatePickerStyle())
    //                .padding()
    //
    //            Button("Confirm") {
    //                selectedDate = tempDate
    //                presentationMode.wrappedValue.dismiss()
    //            }
    //            .padding()
    //            .frame(maxWidth: .infinity)
    //            .background(Color.green)
    //            .foregroundColor(.white)
    //            .cornerRadius(10)
    //            .shadow(radius: 3)
    //        }
    //        .padding()
    //        .navigationTitle("Pick a Date")
    //    }
    //}
    //
    
    
    
    // ✅ Address Confirmation View
    //struct AddressConfirmationView: View {
    //    @Binding var selectedAddress: String?
    //    @Environment(\.presentationMode) var presentationMode
    //    @State private var addressInput: String = ""
    //    @State private var locationManager = CLLocationManager()
    //    
    //    var body: some View {
    //        VStack(spacing: 20) {
    //            TextField("Enter your address", text: $addressInput)
    //                .textFieldStyle(RoundedBorderTextFieldStyle())
    //                .padding()
    //            
    //            Button("Use Current Location") {
    //                getCurrentLocation()
    //            }
    //            .padding()
    //            .frame(maxWidth: .infinity)
    //            .background(Color.blue)
    //            .foregroundColor(.white)
    //            .cornerRadius(10)
    //            .shadow(radius: 3)
    //            
    //            Button("Confirm") {
    //                selectedAddress = addressInput
    //                presentationMode.wrappedValue.dismiss()
    //            }
    //            .padding()
    //            .frame(maxWidth: .infinity)
    //            .background(Color.green)
    //            .foregroundColor(.white)
    //            .cornerRadius(10)
    //            .shadow(radius: 3)
    //        }
    //        .padding()
    //        .navigationTitle("Confirm Address")
    //    }
    //    
    //    // ✅ Fetch Current Location (Requires Location Permissions)
    //    func getCurrentLocation() {
    //        locationManager.requestWhenInUseAuthorization()
    //        if let location = locationManager.location {
    //            let geocoder = CLGeocoder()
    //            geocoder.reverseGeocodeLocation(location) { placemarks, error in
    //                if let placemark = placemarks?.first {
    //                    addressInput = "\(placemark.name ?? ""), \(placemark.locality ?? ""), \(placemark.country ?? "")"
    //                }
    //            }
    //        }
    //    }
    //}
    //
    //// ✅ Helper Function for Date Formatting
    //func formattedDate(_ date: Date) -> String {
    //    let formatter = DateFormatter()
    //    formatter.dateStyle = .medium
    //    return formatter.string(from: date)
    //}
    
    // ✅ Reusable Request Row Component
    struct RequestRow: View {
        let icon: String
        let text: String
        
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(Color(.sRGB, red: 0.0, green: 0.3, blue: 0.1, opacity: 1.0) )
                
                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }

#Preview {
    RequestView()
}
