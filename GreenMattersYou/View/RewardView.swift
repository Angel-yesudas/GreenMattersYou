//
//  RewardView.swift
//  Greenswiftui
//
//  Created by macbook air m1 on 27/02/25.
//

import SwiftUI

struct RewardView: View {
    @State private var points = 350  // Example user points
    @State private var badges = ["🌱 Green Beginner", "♻️ Eco Hero"]  // Earn
    var body: some View {
                VStack {
                    // Header
                    Text("Your Eco Rewards")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)

                    // Points Display
                    Text("\(points) Points")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.green)
                        .padding()

                    // Earned Badges
                    Text("Your Achievements")
                        .font(.headline)
                        .padding(.top)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(badges, id: \.self) { badge in
                                Text(badge)
                                    .padding()
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }

                    // Rewards Section
                    Text("Redeem Your Points")
                        .font(.headline)
                        .padding(.top)

                    VStack(spacing: 16) {
                        RewardItemView(icon: "gift.fill", title: "Discount Coupon", points: 100, userPoints: $points)
                        RewardItemView(icon: "cart.fill", title: "Reusable Bag", points: 200, userPoints: $points)
                        RewardItemView(icon: "tree.fill", title: "Tree Plantation", points: 300, userPoints: $points)
                    }
                    .padding()

                    Spacer()
                }
                .padding()
                .navigationTitle("Rewards")
            }
        }

        struct RewardItemView: View {
            let icon: String
            let title: String
            let points: Int
            @Binding var userPoints: Int

            var body: some View {
                HStack {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.green)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                        Text("\(points) Points")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()

                    if userPoints >= points {
                        Button("Redeem") {
                            userPoints -= points  // Deduct points
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    } else {
                        Text("Not enough points")
                            .foregroundColor(.red)
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
        }

        #Preview {
            RewardView()
        }

    


#Preview {
    RewardView()
}
