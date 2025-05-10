//
//  CommunityswapAndshare.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 28/03/25.
//

import SwiftUI


    

    // ✅ Model for Exchange Items
    struct ExchangeItem: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let category: String
        let owner: String
        let image: String
    }

    // ✅ Sample Data
    let sampleItems: [ExchangeItem] = [
        ExchangeItem(title: "Wooden Chair", description: "Gently used wooden chair, perfect for home decor.", category: "Furniture", owner: "Alice", image: "chair"),
        ExchangeItem(title: "Books Collection", description: "Set of novels and self-help books in good condition.", category: "Books", owner: "John", image: "books"),
        ExchangeItem(title: "Ceramic Pots", description: "Beautiful handmade ceramic pots for plants.", category: "Garden", owner: "Emma", image: "pots"),
        ExchangeItem(title: "Toy Car Set", description: "A collection of toy cars for kids.", category: "Toys", owner: "Mike", image: "toycar")
    ]

    // ✅ Exchange Items View
struct CommunityswapAndshare: View {
    
        @State private var showAddItemSheet = false
        @State private var items = sampleItems
        
        var body: some View {
            NavigationStack {
                VStack {
                    // ✅ Header
                    HStack {
                        Text("Exchange Reusable Items")
                            .font(.title2.bold())
                        Spacer()
                        Button(action: {
                            showAddItemSheet.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    
                    // ✅ Item Listings
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(items) { item in
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ExchangeItemCard(item: item)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Swap & Share")
                .sheet(isPresented: $showAddItemSheet) {
                    AddItemView(items: $items)
                }
            }
        }
    }

    // ✅ Exchange Item Card
    struct ExchangeItemCard: View {
        let item: ExchangeItem
        
        var body: some View {
            VStack {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .cornerRadius(10)
                
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(item.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Owner: \(item.owner)")
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 4)
        }
    }

    // ✅ Item Detail View
    struct ItemDetailView: View {
        let item: ExchangeItem
        @State private var showExchangeRequest = false
        
        var body: some View {
            VStack(spacing: 20) {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(15)
                
                Text(item.title)
                    .font(.largeTitle.bold())
                
                Text(item.description)
                    .font(.body)
                    .padding()
                
                HStack {
                    Text("Category: \(item.category)")
                    Spacer()
                    Text("Owner: \(item.owner)")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Spacer()
                
                Button(action: {
                    showExchangeRequest.toggle()
                }) {
                    Text("Request Exchange")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showExchangeRequest) {
                    ExchangeRequestView(item: item)
                }
            }
            .padding()
            .navigationTitle("Item Details")
        }
    }

    // ✅ Exchange Request View
    struct ExchangeRequestView: View {
        let item: ExchangeItem
        @State private var message = ""
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Exchange Request for \(item.title)")
                    .font(.title2.bold())
                
                Text("Send a message to \(item.owner) about exchanging this item.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                
                TextField("Write your message...", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    // Handle exchange request logic
                }) {
                    Text("Send Request")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }

    // ✅ Add New Item View
    struct AddItemView: View {
        @Binding var items: [ExchangeItem]
        @State private var title = ""
        @State private var description = ""
        @State private var category = ""
        @State private var owner = ""
        @State private var image = "default"

        let categories = ["Furniture", "Books", "Toys", "Clothing", "Electronics", "Garden", "Miscellaneous"]
        
        var body: some View {
            NavigationStack {
                Form {
                    Section(header: Text("Item Details")) {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        Picker("Category", selection: $category) {
                            ForEach(categories, id: \.self) { cat in
                                Text(cat)
                            }
                        }
                        TextField("Owner Name", text: $owner)
                    }
                    
                    Section {
                        Button(action: {
                            let newItem = ExchangeItem(title: title, description: description, category: category, owner: owner, image: "default")
                            items.append(newItem)
                        }) {
                            Text("Add Item")
                                .font(.title2)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .navigationTitle("Post New Item")
            }
        }
    }

    // ✅ Preview
    
#Preview {
    CommunityswapAndshare()
}
//import SwiftUI
//
//struct ExchangeReusableItemsView: View {
//    // Sample data for items
//    struct ExchangeItem: Identifiable {
//        let id = UUID()
//        let title: String
//        let description: String
//        let category: String
//        let imageName: String
//        let owner: String
//    }
//    
//    @State private var searchText = ""
//    @State private var selectedCategory = "All"
//    
//    let categories = ["All", "Electronics", "Clothing", "Furniture", "Books", "Others"]
//    
//    let items: [ExchangeItem] = [
//        ExchangeItem(title: "Wooden Chair", description: "A well-maintained wooden chair available for exchange.", category: "Furniture", imageName: "chair", owner: "John Doe"),
//        ExchangeItem(title: "Smartphone", description: "Used but functional smartphone for swapping.", category: "Electronics", imageName: "iphone", owner: "Emily"),
//        ExchangeItem(title: "Winter Jacket", description: "Warm and stylish jacket in good condition.", category: "Clothing", imageName: "jacket", owner: "Michael"),
//        ExchangeItem(title: "Story Books", description: "A collection of children's storybooks.", category: "Books", imageName: "book", owner: "Sophia"),
//        ExchangeItem(title: "Laptop Stand", description: "Adjustable laptop stand, perfect for remote work.", category: "Electronics", imageName: "laptopstand", owner: "Emma")
//    ]
//    
//    var filteredItems: [ExchangeItem] {
//        items.filter { item in
//            (selectedCategory == "All" || item.category == selectedCategory) &&
//            (searchText.isEmpty || item.title.localizedCaseInsensitiveContains(searchText))
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // **Search Bar**
//                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                    TextField("Search items...", text: $searchText)
//                        .textFieldStyle(PlainTextFieldStyle())
//                        .padding(8)
//                        .background(Color(.systemGray6))
//                        .cornerRadius(10)
//                }
//                .padding(.horizontal)
//                
//                // **Category Filter**
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(categories, id: \.self) { category in
//                            Text(category)
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 6)
//                                .background(selectedCategory == category ? Color.green.opacity(0.7) : Color.gray.opacity(0.3))
//                                .cornerRadius(15)
//                                .foregroundColor(.white)
//                                .onTapGesture {
//                                    selectedCategory = category
//                                }
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                
//                // **List of Items**
//                ScrollView {
//                    VStack(spacing: 16) {
//                        ForEach(filteredItems) { item in
//                            ExchangeItemCard(item: item)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                
//                Spacer()
//                
//                // **Post New Item Button**
//                Button(action: {
//                    // TODO: Implement item posting feature
//                }) {
//                    HStack {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title)
//                        Text("Post New Item")
//                            .fontWeight(.bold)
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(LinearGradient(colors: [Color.green, Color.blue], startPoint: .leading, endPoint: .trailing))
//                    .cornerRadius(12)
//                    .foregroundColor(.white)
//                }
//                .padding(.horizontal)
//            }
//            .navigationTitle("Exchange Reusable Items")
//            .background(Color(.systemGray6))
//        }
//    }
//}
//
//// **Reusable Card Component for Each Item**
//struct ExchangeItemCard: View {
//    let item: ExchangeReusableItemsView.ExchangeItem
//    
//    var body: some View {
//        HStack {
//            Image(systemName: item.imageName)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 80, height: 80)
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 3)
//            
//            VStack(alignment: .leading, spacing: 5) {
//                Text(item.title)
//                    .font(.headline)
//                
//                Text(item.description)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .lineLimit(2)
//                
//                HStack {
//                    Image(systemName: "person.fill")
//                        .foregroundColor(.blue)
//                    Text("Owner: \(item.owner)")
//                        .font(.footnote)
//                        .foregroundColor(.gray)
//                }
//            }
//            
//            Spacer()
//            
//            // **Exchange Button**
//            Button(action: {
//                // TODO: Implement exchange functionality
//            }) {
//                Text("Exchange")
//                    .font(.subheadline)
//                    .padding(8)
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(15)
//        .shadow(radius: 4)
//    }
//}
//
//// **Preview**
//#Preview {
//    ExchangeReusableItemsView()
//}
