//
//  HomeScreenView.swift
//  GreenMatters
//
//  
//

import SwiftUI

struct HomeScreenView: View {
    struct Feature: Identifiable {
        let id = UUID()
        let title: String
        let subtitle: String
        let icon: String
        let destination: AnyView
    }
    
    let features: [Feature] = [
        Feature(title: "Waste Collection", subtitle: "Track your pickups", icon: "trash.fill", destination: AnyView(WasteScheduleView())),
        Feature(title: "Segregation Guide", subtitle: "Sort waste properly", icon: "leaf.fill", destination: AnyView(WasteSegregationView())),
        Feature(title: "Progress Tracker", subtitle: "Monitor your impact", icon: "chart.bar.fill", destination: AnyView(ProgressTrackerView())),
        Feature(title: "Eco Tips", subtitle: "Daily sustainability tips", icon: "lightbulb.fill", destination: AnyView(EcoTipsView())),
        Feature(title: "Community", subtitle: "Engage with your area", icon: "person.2.fill", destination: AnyView(CommunityView())),
        Feature(title: "Rewards", subtitle: "Earn eco points", icon: "star.fill", destination: AnyView(RewardView()))
    ]
    
    let moreFeatures: [Feature] = [
        Feature(title: "Community Swap & Share", subtitle: "Exchange reusable items", icon: "arrow.2.circlepath", destination: AnyView(CommunityswapAndshare())),
        Feature(title: "Nearest Recycling Centers", subtitle: "Find drop-off points", icon: "mappin.and.ellipse", destination: AnyView(RecyclingCenterView())),
        Feature(title: "Home Composting Guide", subtitle: "Learn to compost food waste", icon: "trash", destination: AnyView(CompostingGuideView())),
        Feature(title: "Personal Eco Score", subtitle: "Track your green contributions", icon: "trophy.fill", destination: AnyView(EcoScoreView()))
    ]

    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // ✅ Home Screen
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // **Header with Profile Image**
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Hello, Angel")
                                    .font(.largeTitle.bold())
                                Text("Welcome to Green Matters!")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            
                            // Profile Image (Now Larger)
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                            }
                        }
                        .padding(.horizontal)
                        
                        // **Feature Grid (2 cards per row)**
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(features) { feature in
                                NavigationLink(destination: feature.destination) {
                                    FeatureCard(title: feature.title, subtitle: feature.subtitle, icon: feature.icon)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // **Horizontal Scrolling for More Features**
                        VStack(alignment: .leading) {
                            Text("More Features")
                                .font(.title2.bold())
                                .padding(.horizontal)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(moreFeatures) { feature in
                                        NavigationLink(destination: feature.destination) {
                                            FeatureCard(title: feature.title, subtitle: feature.subtitle, icon: feature.icon)
                                                .frame(width: 200)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color(.systemGray6))
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            
            // ✅ Request Screen
            RequestView()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Request")
                }
                .tag(1)
            
            // ✅ Alert Screen
            NotificationsViewScreen()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Alert")
                }
                .tag(2)
            
            // ✅ Profile Screen
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.green) // Highlight selected tab
        .navigationBarBackButtonHidden()
    }
}

// ✅ Feature Card Component
struct FeatureCard: View {
    let title: String
    let subtitle: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(
            LinearGradient(colors: [Color.green, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    HomeScreenView()
}

